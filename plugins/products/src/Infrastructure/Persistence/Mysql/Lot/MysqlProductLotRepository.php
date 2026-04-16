<?php

declare(strict_types=1);

namespace Plugin\Products\Infrastructure\Persistence\Mysql\Lot;

use Plugin\Products\Domain\Lot\ProductLot;
use Plugin\Products\Domain\Lot\ProductLotRepository;
use PDO;

class MysqlProductLotRepository implements ProductLotRepository
{
    public function __construct(private PDO $pdo)
    {
}

    public function save(ProductLot $lot): int
    {
        if ($lot->id) {
            $stmt = $this->pdo->prepare("
                UPDATE product_lots 
                SET product_id = :product_id, batch_number = :batch_number, 
                    eatby_date = :eatby_date, sellby_date = :sellby_date, status = :status
                WHERE id = :id
            ");
        } else {
            $stmt = $this->pdo->prepare("
                INSERT INTO product_lots (product_id, batch_number, eatby_date, sellby_date, status)
                VALUES (:product_id, :batch_number, :eatby_date, :sellby_date, :status)
            ");
        }

        $data = $lot->toArray();
        unset($data['created_at'], $data['updated_at']);

        $stmt->execute($data);
        return $lot->id ?? (int) $this->pdo->lastInsertId();
    }

    public function findById(int $id): ?ProductLot
    {
        $stmt = $this->pdo->prepare("SELECT * FROM product_lots WHERE id = :id");
        $stmt->execute(['id' => $id]);
        $data = $stmt->fetch();
        return $data ? ProductLot::fromArray($data) : null;
    }

    public function findByBatchNumber(string $batchNumber): ?ProductLot
    {
        $stmt = $this->pdo->prepare("SELECT * FROM product_lots WHERE batch_number = :batch_number");
        $stmt->execute(['batch_number' => $batchNumber]);
        $data = $stmt->fetch();
        return $data ? ProductLot::fromArray($data) : null;
    }

    public function findByProduct(int $productId): array
    {
        $stmt = $this->pdo->prepare("SELECT * FROM product_lots WHERE product_id = :product_id");
        $stmt->execute(['product_id' => $productId]);
        
        $results = [];
        foreach ($stmt->fetchAll() as $data) {
            $results[] = ProductLot::fromArray($data);
        }
        return $results;
    }

    public function delete(int $id): bool
    {
        $stmt = $this->pdo->prepare("DELETE FROM product_lots WHERE id = :id");
        return $stmt->execute(['id' => $id]);
    }
}
