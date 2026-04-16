<?php

declare(strict_types=1);

namespace Plugin\Hr\Infrastructure\Persistence\Mysql\Salary;

use Plugin\Hr\Domain\Salary\Salary;
use Plugin\Hr\Domain\Salary\SalaryRepository;
use PDO;

class MysqlSalaryRepository implements SalaryRepository
{
    public function __construct(private PDO $pdo)
    {
}

    public function save(Salary $salary): int
    {
        if ($salary->id) {
            $stmt = $this->pdo->prepare("
                UPDATE hr_salaries 
                SET ref = :ref, user_id = :user_id, date_start = :date_start, date_end = :date_end, 
                    amount = :amount, type = :type, status = :status, note = :note
                WHERE id = :id
            ");
        } else {
            $stmt = $this->pdo->prepare("
                INSERT INTO hr_salaries (ref, user_id, date_start, date_end, amount, type, status, note)
                VALUES (:ref, :user_id, :date_start, :date_end, :amount, :type, :status, :note)
            ");
        }
        
        $data = $salary->toArray();
        unset($data['created_at'], $data['updated_at']);
        
        $stmt->execute($data);
        return $salary->id ?? (int) $this->pdo->lastInsertId();
    }

    public function findById(int $id): ?Salary
    {
        $stmt = $this->pdo->prepare("SELECT * FROM hr_salaries WHERE id = :id");
        $stmt->execute(['id' => $id]);
        $data = $stmt->fetch();
        return $data ? Salary::fromArray($data) : null;
    }

    public function findAll(int $limit = 500, int $offset = 0): array
    {
        $stmt = $this->pdo->prepare("SELECT * FROM hr_salaries LIMIT :limit OFFSET :offset");
        $stmt->bindValue(':limit', $limit, PDO::PARAM_INT);
        $stmt->bindValue(':offset', $offset, PDO::PARAM_INT);
        $stmt->execute();
        
        $results = [];
        foreach ($stmt->fetchAll() as $data) {
            $results[] = Salary::fromArray($data);
        }
        return $results;
    }

    public function delete(int $id): bool
    {
        $stmt = $this->pdo->prepare("DELETE FROM hr_salaries WHERE id = :id");
        return $stmt->execute(['id' => $id]);
    }
}
