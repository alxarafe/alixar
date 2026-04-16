<?php

declare(strict_types=1);

namespace Plugin\Trading\Infrastructure\Persistence\Mysql\SupplierOrder;

use Plugin\Trading\Domain\SupplierOrder\SupplierOrder;
use Plugin\Trading\Domain\SupplierOrder\SupplierOrderRepository;
use Plugin\Trading\Infrastructure\Persistence\Mysql\Shared\AbstractMysqlTradingRepository;
use PDO;

class MysqlSupplierOrderRepository extends AbstractMysqlTradingRepository implements SupplierOrderRepository
{
    private string $table = 'supplier_orders';
    private string $lineTable = 'supplier_order_lines';
    private string $fkColumn = 'supplier_order_id';

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

    public function findById(int $id): ?SupplierOrder
    {
        $row = $this->findByIdBase($id, $this->table);
        return $row ? $this->mapRow($row) : null;
    }

    public function findByRef(string $ref): ?SupplierOrder
    {
        $row = $this->findByRefBase($ref, $this->table);
        return $row ? $this->mapRow($row) : null;
    }

    public function save(SupplierOrder $order): void
    {
        $data = $this->camelToSnake($order->toArray());
        
        if ($order->getId() === null) {
            unset($data['id']);
            $columns = array_keys($data);
            $placeholders = array_map(fn($c) => ':' . $c, $columns);
            $sql = sprintf('INSERT INTO %s (%s) VALUES (%s)', $this->table, implode(', ', $columns), implode(', ', $placeholders));
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute($data);
            $order->setId((int) $this->pdo->lastInsertId());
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
    public function getLines(int $orderId): array
    {
        return $this->getLinesBase($orderId, $this->lineTable, $this->fkColumn);
    }
    public function addLine(int $orderId, array $data): void
    {
        $this->addLineBase($orderId, $this->camelToSnake($data), $this->lineTable, $this->fkColumn);
    }
    public function updateLine(int $orderId, int $lineId, array $data): void
    {
        $this->updateLineBase($orderId, $lineId, $this->camelToSnake($data), $this->lineTable, $this->fkColumn);
    }
    public function deleteLine(int $orderId, int $lineId): void
    {
        $this->deleteLineBase($orderId, $lineId, $this->lineTable, $this->fkColumn);
    }

    private function mapRow(array $row): SupplierOrder
    {
        $data = [];
        foreach ($row as $k => $v) {
            $camelKeys = lcfirst(str_replace(' ', '', ucwords(str_replace('_', ' ', $k))));
            $data[$camelKeys] = $v;
        }
        return SupplierOrder::fromArray($data + ['id' => $row['id']]);
    }
}
