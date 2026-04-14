<?php

declare(strict_types=1);

namespace Plugin\DolibarrCompat\Infrastructure\Persistence\Mysql\Trading;

use Plugin\Trading\Domain\SupplierInvoice\SupplierInvoice;
use Plugin\Trading\Domain\SupplierInvoice\SupplierInvoiceRepository;
use Plugin\DolibarrCompat\Infrastructure\DolibarrMappingTrait;
use PDO;

class DolibarrMysqlSupplierInvoiceRepository implements SupplierInvoiceRepository
{
    use DolibarrMappingTrait;

    private string $table;

    private const COLUMN_MAP = [
        'id' => 'id',
        'thirdPartyId' => 'fk_soc',
        'ref' => 'ref',
        'refSupplier' => 'ref_supplier',
        'refExt' => 'ref_ext',
        'totalHt' => 'total_ht',
        'totalTva' => 'total_tva',
        'totalTtc' => 'total_ttc',
        'status' => 'fk_statut',
        'createdAt' => 'datec',
        'updatedAt' => 'tms',
    ];

    public function __construct(private PDO $pdo, string $prefix = 'llx_')
    {
        $this->table = $prefix . 'facture_fourn';
    }

    /**
     * @return array<SupplierInvoice>
     */
    #[\Override]
    public function findAll(int $limit = 100, int $offset = 0, string $sortField = 'id', string $sortOrder = 'ASC'): array
    {
        $allowedSortFields = array_values(self::COLUMN_MAP);
        if (!in_array($sortField, $allowedSortFields, true)) {
            $sortField = 'id';
        }

        $sortOrder = strtoupper($sortOrder) === 'DESC' ? 'DESC' : 'ASC';

        $sql = sprintf('SELECT * FROM %s ORDER BY %s %s LIMIT %d OFFSET %d', $this->table, $sortField, $sortOrder, $limit, $offset);
        $stmt = $this->pdo->query($sql);
        
        if (!$stmt) return [];
        $rows = $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];

        $invoices = [];
        foreach ($rows as $row) {
            $invoices[] = SupplierInvoice::fromArray($this->mapToClean($row, self::COLUMN_MAP));
        }

        return $invoices;
    }

    /**
     * @param array<string, mixed> $criteria
     */
    #[\Override]
    public function count(array $criteria = []): int
    {
        $stmt = $this->pdo->query('SELECT COUNT(*) FROM ' . $this->table);
        if (!$stmt) return 0;
        return (int) $stmt->fetchColumn();
    }

    #[\Override]
    public function findById(int $id): ?SupplierInvoice
    {
        $stmt = $this->pdo->prepare('SELECT * FROM ' . $this->table . ' WHERE id = :id');
        $stmt->execute(['id' => $id]);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$row) return null;

        return SupplierInvoice::fromArray($this->mapToClean($row, self::COLUMN_MAP));
    }

    #[\Override]
    public function findByRef(string $ref): ?SupplierInvoice
    {
        $stmt = $this->pdo->prepare('SELECT * FROM ' . $this->table . ' WHERE ref = :ref');
        $stmt->execute(['ref' => $ref]);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$row) return null;

        return SupplierInvoice::fromArray($this->mapToClean($row, self::COLUMN_MAP));
    }

    #[\Override]
    public function save(SupplierInvoice $invoice): void
    {
        $dbData = $this->mapToDolibarr($invoice->toArray(), self::COLUMN_MAP);
        unset($dbData['tms']);

        if ($invoice->getId() === null) {
            unset($dbData['id']);
            $dbData['entity'] = 1;

            // Si la ref es (PROV), usamos una temporal única para evitar UK_facture_fourn_ref (ref, entity)
            if (($dbData['ref'] ?? '') === '(PROV)') {
                $dbData['ref'] = '(PROV' . bin2hex(random_bytes(4)) . ')';
            }

            $columns = array_keys($dbData);
            $placeholders = array_map(fn($c) => ':' . $c, $columns);

            $sql = sprintf('INSERT INTO %s (%s) VALUES (%s)', $this->table, implode(', ', $columns), implode(', ', $placeholders));
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
            unset($dbData['datec']);

            $sets = array_map(fn($c) => "{$c} = :{$c}", array_keys($dbData));

            $sql = sprintf('UPDATE %s SET %s WHERE id = :id', $this->table, implode(', ', $sets));
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute(['id' => $id] + $dbData);
        }
    }

    #[\Override]
    public function delete(int $id): void
    {
        $stmt = $this->pdo->prepare('DELETE FROM ' . $this->table . ' WHERE id = :id');
        $stmt->execute(['id' => $id]);
    }

    // --- Lines (llx_facture_fourn_det) ---
    #[\Override]
    public function getLines(int $invoiceId): array
    {
        $stmt = $this->pdo->prepare("SELECT * FROM {$this->table}_det WHERE fk_facture_fourn = :id");
        $stmt->execute(['id' => $invoiceId]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];
    }

    #[\Override]
    public function addLine(int $invoiceId, array $data): void
    {
        $data['fk_facture_fourn'] = $invoiceId;
        
        if (!isset($data['qty'])) $data['qty'] = 1;
        if (!isset($data['tva_tx'])) $data['tva_tx'] = 0;
        
        $columns = array_keys($data);
        $placeholders = array_map(fn($c) => ':' . $c, $columns);
        $sql = sprintf("INSERT INTO {$this->table}_det (%s) VALUES (%s)", implode(', ', $columns), implode(', ', $placeholders));
        
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute($data);
    }

    #[\Override]
    public function updateLine(int $invoiceId, int $lineId, array $data): void
    {
        unset($data['id']);
        unset($data['fk_facture_fourn']);

        $sets = array_map(fn($c) => "{$c} = :{$c}", array_keys($data));
        $sql = sprintf("UPDATE {$this->table}_det SET %s WHERE id = :lineId AND fk_facture_fourn = :invoiceId", implode(', ', $sets));
        
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute(['lineId' => $lineId, 'invoiceId' => $invoiceId] + $data);
    }

    #[\Override]
    public function deleteLine(int $invoiceId, int $lineId): void
    {
        $stmt = $this->pdo->prepare("DELETE FROM {$this->table}_det WHERE id = :lineId AND fk_facture_fourn = :invoiceId");
        $stmt->execute(['lineId' => $lineId, 'invoiceId' => $invoiceId]);
    }

    // --- Payments ---
    #[\Override]
    public function getPayments(int $invoiceId): array
    {
        $sql = "SELECT p.* FROM llx_paiementfourn p
                INNER JOIN llx_paiementfourn_facturefourn pf ON pf.fk_paiementfourn = p.rowid
                WHERE pf.fk_facturefourn = :id";
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute(['id' => $invoiceId]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];
    }

    #[\Override]
    public function addPayment(int $invoiceId, array $data): void
    {
        // Simplistic payment creation linked to the invoice
        $stmt = $this->pdo->prepare("INSERT INTO llx_paiementfourn (datec, amount, fk_payment_mode) VALUES (NOW(), :amount, :mode)");
        $stmt->execute([
            'amount' => $data['amount'] ?? 0,
            'mode' => $data['payment_mode_id'] ?? 1
        ]);
        
        $paymentId = $this->pdo->lastInsertId();
        
        $stmtBridge = $this->pdo->prepare("INSERT INTO llx_paiementfourn_facturefourn (fk_paiementfourn, fk_facturefourn, amount) VALUES (:payId, :invId, :amount)");
        $stmtBridge->execute(['payId' => $paymentId, 'invId' => $invoiceId, 'amount' => $data['amount'] ?? 0]);
    }
}
