<?php

declare(strict_types=1);

namespace Plugin\Trading\Infrastructure\Persistence\Mysql;

use Plugin\Trading\Domain\SupplierOrder\SupplierOrder;
use Plugin\Trading\Domain\SupplierOrder\SupplierOrderRepository;
use Core\Infrastructure\DolibarrMappingTrait;
use PDO;

class MysqlSupplierOrderRepository implements SupplierOrderRepository
{
    use DolibarrMappingTrait;

    private string $table;

    // Dolibarr's 'llx_commande_fournisseur' uses these mapping columns
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
        'createdAt' => 'date_creation',
        'updatedAt' => 'tms',
    ];

    public function __construct(private PDO $pdo, string $prefix = 'llx_')
    {
        $this->table = $prefix . 'commande_fournisseur';
    }

    /**
     * @return array<SupplierOrder>
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

        $orders = [];
        foreach ($rows as $row) {
            $orders[] = SupplierOrder::fromArray($this->mapToClean($row, self::COLUMN_MAP));
        }

        return $orders;
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
    public function findById(int $id): ?SupplierOrder
    {
        $stmt = $this->pdo->prepare('SELECT * FROM ' . $this->table . ' WHERE id = :id');
        $stmt->execute(['id' => $id]);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$row) return null;

        return SupplierOrder::fromArray($this->mapToClean($row, self::COLUMN_MAP));
    }

    #[\Override]
    public function findByRef(string $ref): ?SupplierOrder
    {
        $stmt = $this->pdo->prepare('SELECT * FROM ' . $this->table . ' WHERE ref = :ref');
        $stmt->execute(['ref' => $ref]);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$row) return null;

        return SupplierOrder::fromArray($this->mapToClean($row, self::COLUMN_MAP));
    }

    #[\Override]
    public function save(SupplierOrder $order): void
    {
        $dbData = $this->mapToDolibarr($order->toArray(), self::COLUMN_MAP);
        unset($dbData['tms']);

        if ($order->getId() === null) {
            unset($dbData['id']);
            $dbData['entity'] = 1;
            $dbData['source'] = 0; // Dolibarr schema requires this NOT NULL field

            // Si la ref es (PROV), usamos una temporal única para evitar UK_commande_fournisseur_ref (ref, entity)
            if (($dbData['ref'] ?? '') === '(PROV)') {
                $dbData['ref'] = '(PROV' . bin2hex(random_bytes(4)) . ')';
            }

            $columns = array_keys($dbData);
            $placeholders = array_map(fn($c) => ':' . $c, $columns);

            $sql = sprintf('INSERT INTO %s (%s) VALUES (%s)', $this->table, implode(', ', $columns), implode(', ', $placeholders));
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute($dbData);
            
            $order->setId((int) $this->pdo->lastInsertId());

            // Actualizar a la definitiva (PROV{ID}) si era provisional
            if (str_starts_with($dbData['ref'], '(PROV')) {
                $finalProvRef = '(PROV' . $order->getId() . ')';
                $this->pdo->prepare("UPDATE {$this->table} SET ref = ? WHERE id = ?")
                    ->execute([$finalProvRef, $order->getId()]);
            }
        } else {
            $id = $dbData['id'];
            unset($dbData['id']);
            unset($dbData['date_creation']);

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

    // --- Lines (llx_commande_fournisseurdet) ---
    #[\Override]
    public function getLines(int $orderId): array
    {
        $stmt = $this->pdo->prepare("SELECT * FROM {$this->table}det WHERE fk_commande = :id");
        $stmt->execute(['id' => $orderId]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];
    }

    #[\Override]
    public function addLine(int $orderId, array $data): void
    {
        $data['fk_commande'] = $orderId;
        
        if (!isset($data['qty'])) $data['qty'] = 1;
        if (!isset($data['tva_tx'])) $data['tva_tx'] = 0;
        
        $columns = array_keys($data);
        $placeholders = array_map(fn($c) => ':' . $c, $columns);
        $sql = sprintf("INSERT INTO {$this->table}det (%s) VALUES (%s)", implode(', ', $columns), implode(', ', $placeholders));
        
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute($data);
    }

    #[\Override]
    public function updateLine(int $orderId, int $lineId, array $data): void
    {
        unset($data['id']);
        unset($data['fk_commande']);

        $sets = array_map(fn($c) => "{$c} = :{$c}", array_keys($data));
        $sql = sprintf("UPDATE {$this->table}det SET %s WHERE id = :lineId AND fk_commande = :orderId", implode(', ', $sets));
        
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute(['lineId' => $lineId, 'orderId' => $orderId] + $data);
    }

    #[\Override]
    public function deleteLine(int $orderId, int $lineId): void
    {
        $stmt = $this->pdo->prepare("DELETE FROM {$this->table}det WHERE id = :lineId AND fk_commande = :orderId");
        $stmt->execute(['lineId' => $lineId, 'orderId' => $orderId]);
    }
}
