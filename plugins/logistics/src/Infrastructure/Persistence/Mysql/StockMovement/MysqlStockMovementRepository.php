<?php

declare(strict_types=1);

namespace Plugin\Logistics\Infrastructure\Persistence\Mysql\StockMovement;

use PDO;
use Plugin\Logistics\Domain\StockMovement\StockMovement;
use Plugin\Logistics\Domain\StockMovement\StockMovementRepository;

class MysqlStockMovementRepository implements StockMovementRepository
{
    private string $table = 'stock_movements';

    public function __construct(private PDO $pdo)
    {
    }

    public function findAll(int $limit = 100, int $offset = 0, string $sortField = 'id', string $sortOrder = 'ASC'): array
    {
        $sortField = $sortField === 'rowid' ? 'id' : $sortField;
        $sql = "SELECT * FROM {$this->table} ORDER BY {$sortField} {$sortOrder} LIMIT {$limit} OFFSET {$offset}";
        $stmt = $this->pdo->query($sql);

        $results = [];
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $results[] = $this->mapRowToEntity($row);
        }

        return $results;
    }

    public function findById(int $id): ?StockMovement
    {
        $stmt = $this->pdo->prepare("SELECT * FROM {$this->table} WHERE id = :id");
        $stmt->execute(['id' => $id]);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$row) return null;
        return $this->mapRowToEntity($row);
    }

    public function findByProduct(int $productId): array
    {
        $stmt = $this->pdo->prepare("SELECT * FROM {$this->table} WHERE product_id = :id");
        $stmt->execute(['id' => $productId]);
        
        $results = [];
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $results[] = $this->mapRowToEntity($row);
        }
        return $results;
    }
    
    public function findByWarehouse(int $warehouseId): array
    {
        $stmt = $this->pdo->prepare("SELECT * FROM {$this->table} WHERE warehouse_id = :id");
        $stmt->execute(['id' => $warehouseId]);
        
        $results = [];
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $results[] = $this->mapRowToEntity($row);
        }
        return $results;
    }

    public function save(StockMovement $movement): void
    {
        if ($movement->getId() === null) {
            $this->insert($movement);
        } else {
            $this->update($movement);
        }
    }

    private function insert(StockMovement $movement): void
    {
        $data = $movement->toArray();
        $mappedData = $this->mapEntityToRow($data);
        unset($mappedData['id']);

        $columns = array_keys($mappedData);
        $placeholders = array_map(fn($c) => ':' . $c, $columns);
        $sql = sprintf('INSERT INTO %s (%s) VALUES (%s)', $this->table, implode(', ', $columns), implode(', ', $placeholders));

        $this->pdo->prepare($sql)->execute($mappedData);
        $movement->setId((int) $this->pdo->lastInsertId());
    }

    private function update(StockMovement $movement): void
    {
        $data = $movement->toArray();
        $mappedData = $this->mapEntityToRow($data);
        $id = $mappedData['id'];
        unset($mappedData['id']);

        $sets = array_map(fn($c) => "{$c} = :{$c}", array_keys($mappedData));
        $sql = sprintf('UPDATE %s SET %s WHERE id = :id', $this->table, implode(', ', $sets));

        $this->pdo->prepare($sql)->execute(['id' => $id] + $mappedData);
    }

    public function delete(int $id): void
    {
        $this->pdo->prepare("DELETE FROM {$this->table} WHERE id = :id")->execute(['id' => $id]);
    }

    private function mapRowToEntity(array $row): StockMovement
    {
        return StockMovement::fromArray([
            'id' => (int) $row['id'],
            'productId' => (int) $row['product_id'],
            'warehouseId' => (int) $row['warehouse_id'],
            'qty' => (float) $row['qty'],
            'type' => (int) $row['type'],
            'label' => $row['label'],
            'inventoryCode' => $row['inventory_code'],
            'price' => (float) $row['price'],
            'date' => $row['date']
        ]);
    }

    private function mapEntityToRow(array $data): array
    {
        return [
            'id' => $data['id'] !== null ? (int) $data['id'] : null,
            'product_id' => $data['productId'],
            'warehouse_id' => $data['warehouseId'],
            'qty' => $data['qty'],
            'type' => $data['type'],
            'label' => $data['label'],
            'inventory_code' => $data['inventoryCode'],
            'price' => $data['price'],
            'date' => $data['date']
        ];
    }
}
