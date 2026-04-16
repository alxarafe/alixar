<?php

declare(strict_types=1);

namespace Plugin\Mrp\Infrastructure\Persistence\Mysql\Bom;

use Plugin\Mrp\Domain\Bom\Bom;
use Plugin\Mrp\Domain\Bom\BomRepository;
use PDO;

class MysqlBomRepository implements BomRepository
{
    public function __construct(private PDO $pdo)
    {
}

    public function save(Bom $bom): int
    {
        if ($bom->id) {
            $stmt = $this->pdo->prepare("
                UPDATE mrp_boms 
                SET ref = :ref, label = :label, product_id = :product_id, qty = :qty, status = :status
                WHERE id = :id
            ");
        } else {
            $stmt = $this->pdo->prepare("
                INSERT INTO mrp_boms (ref, label, product_id, qty, status)
                VALUES (:ref, :label, :product_id, :qty, :status)
            ");
        }
        
        $data = $bom->toArray();
        unset($data['created_at'], $data['updated_at']);
        
        $stmt->execute($data);
        return $bom->id ?? (int) $this->pdo->lastInsertId();
    }

    public function findById(int $id): ?Bom
    {
        $stmt = $this->pdo->prepare("SELECT * FROM mrp_boms WHERE id = :id");
        $stmt->execute(['id' => $id]);
        $data = $stmt->fetch();
        return $data ? Bom::fromArray($data) : null;
    }

    public function findAll(int $limit = 500, int $offset = 0): array
    {
        $stmt = $this->pdo->prepare("SELECT * FROM mrp_boms LIMIT :limit OFFSET :offset");
        $stmt->bindValue(':limit', $limit, PDO::PARAM_INT);
        $stmt->bindValue(':offset', $offset, PDO::PARAM_INT);
        $stmt->execute();
        
        $results = [];
        foreach ($stmt->fetchAll() as $data) {
            $results[] = Bom::fromArray($data);
        }
        return $results;
    }

    public function delete(int $id): bool
    {
        $stmt = $this->pdo->prepare("DELETE FROM mrp_boms WHERE id = :id");
        return $stmt->execute(['id' => $id]);
    }
}
