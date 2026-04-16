<?php

declare(strict_types=1);

namespace Plugin\Hr\Infrastructure\Persistence\Mysql\Leave;

use Plugin\Hr\Domain\Leave\Leave;
use Plugin\Hr\Domain\Leave\LeaveRepository;
use PDO;

class MysqlLeaveRepository implements LeaveRepository
{
    public function __construct(private PDO $pdo)
    {
}

    public function save(Leave $leave): int
    {
        if ($leave->id) {
            $stmt = $this->pdo->prepare("
                UPDATE hr_leaves 
                SET ref = :ref, user_id = :user_id, type = :type, date_start = :date_start, 
                    date_end = :date_end, is_half_day = :is_half_day, status = :status, description = :description
                WHERE id = :id
            ");
        } else {
            $stmt = $this->pdo->prepare("
                INSERT INTO hr_leaves (ref, user_id, type, date_start, date_end, is_half_day, status, description)
                VALUES (:ref, :user_id, :type, :date_start, :date_end, :is_half_day, :status, :description)
            ");
        }
        
        $data = $leave->toArray();
        unset($data['created_at'], $data['updated_at']);
        
        $stmt->execute($data);
        return $leave->id ?? (int) $this->pdo->lastInsertId();
    }

    public function findById(int $id): ?Leave
    {
        $stmt = $this->pdo->prepare("SELECT * FROM hr_leaves WHERE id = :id");
        $stmt->execute(['id' => $id]);
        $data = $stmt->fetch();
        return $data ? Leave::fromArray($data) : null;
    }

    public function findAll(int $limit = 500, int $offset = 0): array
    {
        $stmt = $this->pdo->prepare("SELECT * FROM hr_leaves LIMIT :limit OFFSET :offset");
        $stmt->bindValue(':limit', $limit, PDO::PARAM_INT);
        $stmt->bindValue(':offset', $offset, PDO::PARAM_INT);
        $stmt->execute();
        
        $results = [];
        foreach ($stmt->fetchAll() as $data) {
            $results[] = Leave::fromArray($data);
        }
        return $results;
    }

    public function delete(int $id): bool
    {
        $stmt = $this->pdo->prepare("DELETE FROM hr_leaves WHERE id = :id");
        return $stmt->execute(['id' => $id]);
    }
}
