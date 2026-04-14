<?php

declare(strict_types=1);

namespace Plugin\Trading\Infrastructure\Persistence\Mysql\Invoice;

use Plugin\Trading\Domain\Invoice\Invoice;
use Plugin\Trading\Domain\Invoice\InvoiceLine;
use Plugin\Trading\Domain\Invoice\InvoiceRepository;
use Plugin\Trading\Infrastructure\Persistence\Mysql\Shared\AbstractMysqlTradingRepository;
use PDO;

class MysqlInvoiceRepository extends AbstractMysqlTradingRepository implements InvoiceRepository
{
    private string $table = 'invoices';
    private string $lineTable = 'invoice_lines';
    private string $contactTable = 'invoice_contacts';
    private string $fkColumn = 'invoice_id';

    public function findAll(array $filters = [], int $limit = 100, int $offset = 0, string $sortField = 'id', string $sortOrder = 'ASC'): array
    {
        if ($sortField === 'rowid' || $sortField === 't.rowid') $sortField = 'id';
        $sortOrder = strtoupper($sortOrder) === 'DESC' ? 'DESC' : 'ASC';

        list($whereSql, $params) = $this->buildWhere($filters);
        
        $sql = sprintf(
            'SELECT * FROM %s %s ORDER BY %s %s LIMIT %d OFFSET %d',
            $this->table, $whereSql, $sortField, $sortOrder, $limit, $offset
        );
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute($params);
        $rows = $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];
        
        return array_map(fn($row) => $this->mapRow($row), $rows);
    }

    private function buildWhere(array $filters): array
    {
        $sqls = [];
        $params = [];
        if (!empty($filters['thirdparty_ids'])) {
            $ids = explode(',', $filters['thirdparty_ids']);
            $idPlaceholders = [];
            foreach ($ids as $i => $id) {
                $idPlaceholders[] = ':tp' . $i;
                $params['tp' . $i] = (int) trim($id);
            }
            $sqls[] = 'third_party_id IN (' . implode(',', $idPlaceholders) . ')';
        }
        if (isset($filters['status']) && $filters['status'] !== '') {
            $sqls[] = 'status = :status';
            $params['status'] = (int) $filters['status'];
        }
        return [$sqls ? 'WHERE ' . implode(' AND ', $sqls) : '', $params];
    }

    public function findById(int $id): ?Invoice
    {
        $row = $this->findByIdBase($id, $this->table);
        if (!$row) return null;
        $invoice = $this->mapRow($row);
        
        // Also lazy-load the lines
        $lines = $this->findLinesByInvoiceId($id);
        foreach ($lines as $line) {
            $invoice->addLine($line);
        }
        return $invoice;
    }

    public function findByRef(string $ref): ?Invoice
    {
        $row = $this->findByRefBase($ref, $this->table);
        return $row ? $this->findById((int) $row['id']) : null;
    }

    public function findByRefExt(string $refExt): ?Invoice
    {
        $stmt = $this->pdo->prepare('SELECT id FROM ' . $this->table . ' WHERE ref_ext = :r');
        $stmt->execute(['r' => $refExt]);
        $id = $stmt->fetchColumn();
        return $id ? $this->findById((int) $id) : null;
    }

    public function save(Invoice $invoice): void
    {
        $data = $this->camelToSnake($invoice->toArray());
        unset($data['lines']);
        
        if ($invoice->getId() === null) {
            unset($data['id']);
            $columns = array_keys($data);
            $placeholders = array_map(fn($c) => ':' . $c, $columns);
            $sql = sprintf('INSERT INTO %s (%s) VALUES (%s)', $this->table, implode(', ', $columns), implode(', ', $placeholders));
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute($data);
            $invoice->setId((int) $this->pdo->lastInsertId());
        } else {
            $id = $data['id'];
            unset($data['id'], $data['created_at']);
            $sets = array_map(fn($c) => "{$c} = :{$c}", array_keys($data));
            $sql = sprintf('UPDATE %s SET %s WHERE id = :id', $this->table, implode(', ', $sets));
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute(['id' => $id] + $data);
        }
    }

    public function delete(int $id): void
    {
        $this->pdo->prepare('DELETE FROM ' . $this->lineTable . ' WHERE ' . $this->fkColumn . ' = ?')->execute([$id]);
        $this->pdo->prepare('DELETE FROM ' . $this->contactTable . ' WHERE ' . $this->fkColumn . ' = ?')->execute([$id]);
        $this->deleteBase($id, $this->table);
    }

    // ── Lines ────────────────────────────────────────────

    public function findLinesByInvoiceId(int $invoiceId): array
    {
        $rows = $this->getLinesBase($invoiceId, $this->lineTable, $this->fkColumn);
        return array_map(fn($row) => $this->mapLineRow($row), $rows);
    }

    public function findLineById(int $id): ?InvoiceLine
    {
        $row = $this->findByIdBase($id, $this->lineTable);
        return $row ? $this->mapLineRow($row) : null;
    }

    public function saveLine(InvoiceLine $line): void
    {
        $data = $this->camelToSnake($line->toArray());
        
        if ($line->getId() === null) {
            unset($data['id']);
            $columns = array_keys($data);
            $placeholders = array_map(fn($c) => ':' . $c, $columns);
            $sql = sprintf('INSERT INTO %s (%s) VALUES (%s)', $this->lineTable, implode(', ', $columns), implode(', ', $placeholders));
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute($data);
        } else {
            $id = $data['id'];
            unset($data['id']);
            $sets = array_map(fn($c) => "{$c} = :{$c}", array_keys($data));
            $sql = sprintf('UPDATE %s SET %s WHERE id = :id', $this->lineTable, implode(', ', $sets));
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute(['id' => $id] + $data);
        }
    }

    public function deleteLine(int $lineId): void
    {
        $this->deleteBase($lineId, $this->lineTable);
    }

    public function updateTotals(int $invoiceId): void
    {
        $stmt = $this->pdo->prepare(sprintf('
            SELECT SUM(total_ht) as sum_ht, SUM(total_tva) as sum_tva, SUM(total_ttc) as sum_ttc 
            FROM %s WHERE %s = :id
        ', $this->lineTable, $this->fkColumn));
        $stmt->execute(['id' => $invoiceId]);
        $totals = $stmt->fetch(PDO::FETCH_ASSOC);

        $upd = $this->pdo->prepare(sprintf('
            UPDATE %s SET total_ht = :ht, total_tva = :tva, total_ttc = :ttc WHERE id = :id
        ', $this->table));
        $upd->execute([
            'ht' => $totals['sum_ht'] ?: 0,
            'tva' => $totals['sum_tva'] ?: 0,
            'ttc' => $totals['sum_ttc'] ?: 0,
            'id' => $invoiceId
        ]);
    }

    private function mapRow(array $row): Invoice
    {
        $data = [];
        foreach ($row as $k => $v) {
            $camelKeys = lcfirst(str_replace(' ', '', ucwords(str_replace('_', ' ', $k))));
            $data[$camelKeys] = $v;
        }
        return Invoice::fromArray($data + ['id' => $row['id']]);
    }

    private function mapLineRow(array $row): InvoiceLine
    {
        $data = [];
        foreach ($row as $k => $v) {
            $camelKeys = lcfirst(str_replace(' ', '', ucwords(str_replace('_', ' ', $k))));
            $data[$camelKeys] = $v;
        }
        return InvoiceLine::fromArray($data + ['id' => $row['id']]);
    }
}
