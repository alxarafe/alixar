<?php

declare(strict_types=1);

namespace Plugin\Trading\Infrastructure\Persistence\Mysql;

use Plugin\Trading\Domain\Invoice\Invoice;
use Plugin\Trading\Domain\Invoice\InvoiceLine;
use Plugin\Trading\Domain\Invoice\InvoiceRepository;
use PDO;

class MysqlInvoiceRepository implements InvoiceRepository
{
    use \Core\Infrastructure\DolibarrMappingTrait;

    private const INVOICE_COLUMN_MAP = [
        'id' => 'id',
        'ref' => 'ref',
        'entity' => 'entity',
        'type' => 'type',
        'thirdPartyId' => 'fk_soc',
        'date' => 'datef',
        'dateDue' => 'date_lim_reglement',
        'status' => 'fk_statut',
        'isPaid' => 'paye',
        'totalHt' => 'total_ht',
        'totalVat' => 'total_tva',
        'totalTtc' => 'total_ttc',
        'paymentTerms' => 'fk_cond_reglement',
        'paymentMode' => 'fk_mode_reglement',
        'notePrivate' => 'note_private',
        'notePublic' => 'note_public',
        'createdAt' => 'datec',
    ];

    private const LINE_COLUMN_MAP = [
        'id' => 'id',
        'invoiceId' => 'fk_facture',
        'productId' => 'fk_product',
        'vatRate' => 'tva_tx',
        'discountPercent' => 'remise_percent',
        'totalHt' => 'total_ht',
        'totalVat' => 'total_tva',
        'totalTtc' => 'total_ttc',
    ];

    private string $table;
    private string $tableLines;

    public function __construct(
        private PDO $pdo,
        string $tablePrefix = '',
    ) {
        $this->table = $tablePrefix . 'facture';
        $this->tableLines = $tablePrefix . 'facturedet';
    }

    #[\Override]
    public function findById(int $id): ?Invoice
    {
        $stmt = $this->pdo->prepare(
            'SELECT * FROM ' . $this->table . ' WHERE id = :id LIMIT 1'
        );
        $stmt->execute(['id' => $id]);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$row) {
            return null;
        }

        $lines = $this->findLinesByInvoiceId($id);
        return Invoice::fromArray($this->mapToClean($row, self::INVOICE_COLUMN_MAP), $lines);
    }

    #[\Override]
    public function findByRef(string $ref): ?Invoice
    {
        $stmt = $this->pdo->prepare(
            'SELECT * FROM ' . $this->table . ' WHERE ref = :ref LIMIT 1'
        );
        $stmt->execute(['ref' => $ref]);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$row) return null;

        $lines = $this->findLinesByInvoiceId((int) $row['id']);
        return Invoice::fromArray($this->mapToClean($row, self::INVOICE_COLUMN_MAP), $lines);
    }

    #[\Override]
    public function findByRefExt(string $refExt): ?Invoice
    {
        $stmt = $this->pdo->prepare(
            'SELECT * FROM ' . $this->table . ' WHERE ref_ext = :refExt LIMIT 1'
        );
        $stmt->execute(['refExt' => $refExt]);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$row) return null;

        $lines = $this->findLinesByInvoiceId((int) $row['id']);
        return Invoice::fromArray($this->mapToClean($row, self::INVOICE_COLUMN_MAP), $lines);
    }

    #[\Override]
    public function save(Invoice $invoice): void
    {
        $data = $invoice->toArray();
        $dbData = $this->mapToDolibarr($data, self::INVOICE_COLUMN_MAP);

        // Transaction is needed to ensure header and lines are saved consistently
        $inTransaction = $this->pdo->inTransaction();
        if (!$inTransaction) {
            $this->pdo->beginTransaction();
        }

        try {
            if ($invoice->getId() === null) {
                unset($dbData['id']);
                
                // Si la ref es (PROV), usamos una temporal única para evitar UK_facture_ref (ref, entity)
                if (($dbData['ref'] ?? '') === '(PROV)') {
                    $dbData['ref'] = '(PROV' . bin2hex(random_bytes(4)) . ')';
                }

                $columns = array_keys($dbData);
                $placeholders = array_map(fn($c) => ':' . $c, $columns);

                $sql = sprintf(
                    'INSERT INTO %s (%s) VALUES (%s)',
                    $this->table,
                    implode(', ', $columns),
                    implode(', ', $placeholders)
                );

                $stmt = $this->pdo->prepare($sql);
                $stmt->execute($dbData);
                $invoice->setId((int) $this->pdo->lastInsertId());

                // Actualizar a la definitiva (PROV{ID}) si era provisional
                if (str_starts_with($dbData['ref'], '(PROV')) {
                    $finalProvRef = '(PROV' . $invoice->getId() . ')';
                    $this->pdo->prepare("UPDATE {$this->table} SET ref = ? WHERE id = ?")
                        ->execute([$finalProvRef, $invoice->getId()]);
                }
            } else {
                $id = $dbData['id'];
                unset($dbData['id']);
                $sets = array_map(fn($c) => "{$c} = :{$c}", array_keys($dbData));

                $sql = sprintf(
                    'UPDATE %s SET %s WHERE id = :id',
                    $this->table,
                    implode(', ', $sets)
                );

                $stmt = $this->pdo->prepare($sql);
                $stmt->execute(['id' => $id] + $dbData);
            }

            foreach ($invoice->getLines() as $line) {
                if ($line->getInvoiceId() === 0 || $line->getInvoiceId() === null) {
                    $lineReflection = new \ReflectionClass(\Plugin\Trading\Domain\Invoice\InvoiceLine::class);
                    $prop = $lineReflection->getProperty('invoiceId');
                    $prop->setAccessible(true);
                    $prop->setValue($line, $invoice->getId());
                }
                $this->saveLine($line);
            }

            $this->updateTotals((int) $invoice->getId());

            if (!$inTransaction) {
                $this->pdo->commit();
            }
        } catch (\Throwable $e) {
            if (!$inTransaction) {
                $this->pdo->rollBack();
            }
            throw $e;
        }
    }

    #[\Override]
    public function delete(int $id): void
    {
        $inTransaction = $this->pdo->inTransaction();
        if (!$inTransaction) {
            $this->pdo->beginTransaction();
        }

        try {
            $stmtLines = $this->pdo->prepare('DELETE FROM ' . $this->tableLines . ' WHERE fk_facture = :id');
            $stmtLines->execute(['id' => $id]);

            $stmt = $this->pdo->prepare('DELETE FROM ' . $this->table . ' WHERE id = :id');
            $stmt->execute(['id' => $id]);

            if (!$inTransaction) {
                $this->pdo->commit();
            }
        } catch (\Throwable $e) {
            if (!$inTransaction) {
                $this->pdo->rollBack();
            }
            throw $e;
        }
    }

    #[\Override]
    public function findAll(
        array $filters = [],
        int $limit = 100,
        int $offset = 0,
        string $sortField = 't.rowid',
        string $sortOrder = 'ASC',
    ): array {
        $where = ['1=1'];
        $params = [];

        if (!empty($filters['thirdparty_ids'])) {
            $ids = array_map('intval', explode(',', $filters['thirdparty_ids']));
            $placeholders = implode(',', $ids);
            $where[] = "t.fk_soc IN ({$placeholders})";
        }

        if (isset($filters['status']) && $filters['status'] !== '') {
            $where[] = "t.fk_statut = :status";
            $params['status'] = (int) $filters['status'];
        }

        $allowedSort = ['t.rowid', 't.ref', 't.datef', 't.total_ttc'];
        if (!in_array($sortField, $allowedSort, true)) {
            $sortField = 't.rowid';
        }
        $sortOrder = strtoupper($sortOrder) === 'DESC' ? 'DESC' : 'ASC';

        $sql = sprintf(
            'SELECT * FROM %s AS t WHERE %s ORDER BY %s %s LIMIT %d OFFSET %d',
            $this->table,
            implode(' AND ', $where),
            $sortField,
            $sortOrder,
            $limit,
            $offset
        );

        $stmt = $this->pdo->prepare($sql);
        $stmt->execute($params);
        $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

        $invoices = [];
        foreach ($rows as $row) {
            $invoices[] = Invoice::fromArray($this->mapToClean($row, self::INVOICE_COLUMN_MAP), []);
        }

        return $invoices;
    }

    // ── Lines ────────────────────────────────────────────

    #[\Override]
    public function findLinesByInvoiceId(int $invoiceId): array
    {
        $stmt = $this->pdo->prepare(
            'SELECT * FROM ' . $this->tableLines . ' WHERE fk_facture = :id ORDER BY rang ASC, rowid ASC'
        );
        $stmt->execute(['id' => $invoiceId]);
        $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

        return array_map(fn(array $row) => InvoiceLine::fromArray($this->mapToClean($row, self::LINE_COLUMN_MAP)), $rows);
    }

    #[\Override]
    public function findLineById(int $id): ?InvoiceLine
    {
        $stmt = $this->pdo->prepare(
            'SELECT * FROM ' . $this->tableLines . ' WHERE id = :id LIMIT 1'
        );
        $stmt->execute(['id' => $id]);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$row) {
            return null;
        }

        return InvoiceLine::fromArray($this->mapToClean($row, self::LINE_COLUMN_MAP));
    }

    #[\Override]
    public function saveLine(InvoiceLine $line): void
    {
        $data = $line->toArray();
        $dbData = $this->mapToDolibarr($data, self::LINE_COLUMN_MAP);

        if ($line->getId() === null) {
            unset($dbData['id']);
            $columns = array_keys($dbData);
            $placeholders = array_map(fn($c) => ':' . $c, $columns);

            $sql = sprintf(
                'INSERT INTO %s (%s) VALUES (%s)',
                $this->tableLines,
                implode(', ', $columns),
                implode(', ', $placeholders)
            );

            $stmt = $this->pdo->prepare($sql);
            $stmt->execute($dbData);
            $line->setId((int) $this->pdo->lastInsertId());
        } else {
            $id = $dbData['id'];
            unset($dbData['id']);

            $sets = array_map(fn($c) => "{$c} = :{$c}", array_keys($dbData));

            $sql = sprintf(
                'UPDATE %s SET %s WHERE id = :id',
                $this->tableLines,
                implode(', ', $sets)
            );

            $stmt = $this->pdo->prepare($sql);
            $stmt->execute(['id' => $id] + $dbData);
        }
    }

    #[\Override]
    public function deleteLine(int $lineId): void
    {
        $stmt = $this->pdo->prepare(
            'DELETE FROM ' . $this->tableLines . ' WHERE id = :id'
        );
        $stmt->execute(['id' => $lineId]);
    }

    #[\Override]
    public function updateTotals(int $invoiceId): void
    {
        $invoice = $this->findById($invoiceId);
        if (!$invoice) {
            return;
        }

        // Recalculating domain logic
        $invoice->recalculateTotals();

        // Update DB header
        $stmt = $this->pdo->prepare(
            'UPDATE ' . $this->table . ' SET total_ht = :ht, total_tva = :tva, total_ttc = :ttc WHERE id = :id'
        );
        $stmt->execute([
            'ht' => $invoice->getTotalHt(),
            'tva' => $invoice->getTotalVat(),
            'ttc' => $invoice->getTotalTtc(),
            'id' => $invoiceId,
        ]);
    }
}
