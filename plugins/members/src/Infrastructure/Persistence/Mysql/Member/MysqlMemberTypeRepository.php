<?php

declare(strict_types=1);

namespace Plugin\Members\Infrastructure\Persistence\Mysql\Member;

use Plugin\Members\Domain\Member\MemberType;
use Plugin\Members\Domain\Member\MemberTypeRepository;
use PDO;

class MysqlMemberTypeRepository implements MemberTypeRepository
{
    public function __construct(private PDO $pdo)
    {
}

    public function save(MemberType $type): int
    {
        if ($type->id) {
            $stmt = $this->pdo->prepare("
                UPDATE member_types 
                SET label = :label, amount = :amount, duration = :duration, active = :active
                WHERE id = :id
            ");
        } else {
            $stmt = $this->pdo->prepare("
                INSERT INTO member_types (label, amount, duration, active)
                VALUES (:label, :amount, :duration, :active)
            ");
        }
        
        $data = $type->toArray();
        unset($data['created_at']); // If present
        
        $stmt->execute($data);
        return $type->id ?? (int) $this->pdo->lastInsertId();
    }

    public function findById(int $id): ?MemberType
    {
        $stmt = $this->pdo->prepare("SELECT * FROM member_types WHERE id = :id");
        $stmt->execute(['id' => $id]);
        $data = $stmt->fetch();
        return $data ? MemberType::fromArray($data) : null;
    }

    public function findAll(): array
    {
        $stmt = $this->pdo->query("SELECT * FROM member_types ORDER BY label ASC");
        $results = [];
        foreach ($stmt->fetchAll() as $data) {
            $results[] = MemberType::fromArray($data);
        }
        return $results;
    }

    public function delete(int $id): bool
    {
        $stmt = $this->pdo->prepare("DELETE FROM member_types WHERE id = :id");
        return $stmt->execute(['id' => $id]);
    }
}
