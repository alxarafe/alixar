<?php

declare(strict_types=1);

namespace Plugin\Mrp\Infrastructure\Persistence\Mysql\ManufacturingOrder;

use Plugin\Mrp\Domain\ManufacturingOrder\ManufacturingOrder;
use Plugin\Mrp\Domain\ManufacturingOrder\ManufacturingOrderRepository;
use PDO;

class MysqlManufacturingOrderRepository implements ManufacturingOrderRepository
{
    public function __construct(private PDO $pdo)
    {
}

    public function save(ManufacturingOrder $mo): int
    {
        if ($mo->id) {
            $stmt = $this->pdo->prepare("
                UPDATE mrp_mos 
                SET ref = :ref, label = :label, bom_id = :bom_id, qty_to_produce = :qty_to_produce, 
                    status = :status, date_start = :date_start, date_end = :date_end
                WHERE id = :id
            ");
        } else {
            $stmt = $this->pdo->prepare("
                INSERT INTO mrp_mos (ref, label, bom_id, qty_to_produce, status, date_start, date_end)
                VALUES (:ref, :label, :bom_id, :qty_to_produce, :status, :date_start, :date_end)
            ");
        }
        
        $data = $mo->toArray();
        unset($data['created_at'], $data['updated_at']);
        
        $stmt->execute($data);
        return $mo->id ?? (int) $this->pdo->lastInsertId();
    }

    public function findById(int $id): ?ManufacturingOrder
    {
        $stmt = $this->pdo->prepare("SELECT * FROM mrp_mos WHERE id = :id");
        $stmt->execute(['id' => $id]);
        $data = $stmt->fetch();
        return $data ? ManufacturingOrder::fromArray($data) : null;
    }

    public function findAll(int $limit = 500, int $offset = 0): array
    {
        $stmt = $this->pdo->prepare("SELECT * FROM mrp_mos LIMIT :limit OFFSET :offset");
        $stmt->bindValue(':limit', $limit, PDO::PARAM_INT);
        $stmt->bindValue(':offset', $offset, PDO::PARAM_INT);
        $stmt->execute();
        
        $results = [];
        foreach ($stmt->fetchAll() as $data) {
            $results[] = ManufacturingOrder::fromArray($data);
        }
        return $results;
    }

    public function delete(int $id): bool
    {
        $stmt = $this->pdo->prepare("DELETE FROM mrp_mos WHERE id = :id");
        return $stmt->execute(['id' => $id]);
    }
}
