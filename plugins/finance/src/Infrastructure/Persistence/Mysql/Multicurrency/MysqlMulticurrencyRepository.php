<?php

declare(strict_types=1);

namespace Plugin\Finance\Infrastructure\Persistence\Mysql\Multicurrency;

use Plugin\Finance\Domain\Multicurrency\Multicurrency;
use Plugin\Finance\Domain\Multicurrency\MulticurrencyRepository;
use PDO;

class MysqlMulticurrencyRepository implements MulticurrencyRepository
{
    public function __construct(private PDO $pdo)
    {
}

    public function save(Multicurrency $mc): int
    {
        if ($mc->id) {
            $stmt = $this->pdo->prepare("
                UPDATE finance_multicurrencies 
                SET code = :code, name = :name, rate = :rate, status = :status
                WHERE id = :id
            ");
        } else {
            $stmt = $this->pdo->prepare("
                INSERT INTO finance_multicurrencies (code, name, rate, status)
                VALUES (:code, :name, :rate, :status)
            ");
        }
        
        $data = $mc->toArray();
        unset($data['created_at'], $data['updated_at']);
        
        $stmt->execute($data);
        return $mc->id ?? (int) $this->pdo->lastInsertId();
    }

    public function findById(int $id): ?Multicurrency
    {
        $stmt = $this->pdo->prepare("SELECT * FROM finance_multicurrencies WHERE id = :id");
        $stmt->execute(['id' => $id]);
        $data = $stmt->fetch();
        return $data ? Multicurrency::fromArray($data) : null;
    }

    public function findAll(): array
    {
        $stmt = $this->pdo->query("SELECT * FROM finance_multicurrencies ORDER BY code ASC");
        $results = [];
        foreach ($stmt->fetchAll() as $data) {
            $results[] = Multicurrency::fromArray($data);
        }
        return $results;
    }

    public function delete(int $id): bool
    {
        $stmt = $this->pdo->prepare("DELETE FROM finance_multicurrencies WHERE id = :id");
        return $stmt->execute(['id' => $id]);
    }
}
