<?php

declare(strict_types=1);

namespace Plugin\Trading\Infrastructure\Persistence\Mysql\SupplierInvoice;

use Plugin\Trading\Domain\SupplierInvoice\SupplierInvoice;
use Plugin\Trading\Domain\SupplierInvoice\SupplierInvoiceRepository;
use Plugin\Trading\Infrastructure\Persistence\Mysql\Shared\AbstractMysqlTradingRepository;
use PDO;

class MysqlSupplierInvoiceRepository extends AbstractMysqlTradingRepository implements SupplierInvoiceRepository
{
    private string $table = 'supplier_invoices';
    private string $lineTable = 'supplier_invoice_lines';
    private string $fkColumn = 'supplier_invoice_id';

    public function findAll(int $limit = 100, int $offset = 0, string $sortField = 'id', string $sortOrder = 'ASC'): array
    {
        if ($sortField === 'rowid' || $sortField === 't.rowid') $sortField = 'id';
        $sortOrder = strtoupper($sortOrder) === 'DESC' ? 'DESC' : 'ASC';

        $sql = sprintf(
            'SELECT * FROM %s ORDER BY %s %s LIMIT %d OFFSET %d',
            $this->table, $sortField, $sortOrder, $limit, $offset
        );
        $stmt = $this->pdo->query($sql);
        $rows = $stmt ? $stmt->fetchAll(PDO::FETCH_ASSOC) : [];
        return array_map(fn($row) => $this->mapRow($row), $rows);
    }

    public function count(array $criteria = []): int
    {
        $stmt = $this->pdo->query('SELECT COUNT(*) FROM ' . $this->table);
        return (int) ($stmt ? $stmt->fetchColumn() : 0);
    }

    public function findById(int $id): ?SupplierInvoice
    {
        $row = $this->findByIdBase($id, $this->table);
        return $row ? $this->mapRow($row) : null;
    }

    public function findByRef(string $ref): ?SupplierInvoice
    {
        $row = $this->findByRefBase($ref, $this->table);
        return $row ? $this->mapRow($row) : null;
    }

    public function save(SupplierInvoice $invoice): void
    {
        $data = $this->camelToSnake($invoice->toArray());
        
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
        $this->deleteBase($id, $this->table);
    }

    // Lines
    public function getLines(int $invoiceId): array
    {
        return $this->getLinesBase($invoiceId, $this->lineTable, $this->fkColumn);
    }
    public function addLine(int $invoiceId, array $data): void
    {
        $this->addLineBase($invoiceId, $this->camelToSnake($data), $this->lineTable, $this->fkColumn);
    }
    public function updateLine(int $invoiceId, int $lineId, array $data): void
    {
        $this->updateLineBase($invoiceId, $lineId, $this->camelToSnake($data), $this->lineTable, $this->fkColumn);
    }
    public function deleteLine(int $invoiceId, int $lineId): void
    {
        $this->deleteLineBase($invoiceId, $lineId, $this->lineTable, $this->fkColumn);
    }

    // Payments (not modeled yet in our domain db script but requested by interface. Ignoring for now by returning empty arrays, same as Legacy repo probably did or let's implement basic)
    public function getPayments(int $invoiceId): array
    {
        return []; 
    }
    public function addPayment(int $invoiceId, array $data): void
    {
        // No-op for now unless payment tables are introduced
    }

    private function mapRow(array $row): SupplierInvoice
    {
        $data = [];
        foreach ($row as $k => $v) {
            $camelKeys = lcfirst(str_replace(' ', '', ucwords(str_replace('_', ' ', $k))));
            $data[$camelKeys] = $v;
        }
        return SupplierInvoice::fromArray($data + ['id' => $row['id']]);
    }
}
