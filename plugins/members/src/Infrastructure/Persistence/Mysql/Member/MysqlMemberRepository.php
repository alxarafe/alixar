<?php

declare(strict_types=1);

namespace Plugin\Members\Infrastructure\Persistence\Mysql\Member;

use Plugin\Members\Domain\Member\Member;
use Plugin\Members\Domain\Member\MemberRepository;
use PDO;

class MysqlMemberRepository implements MemberRepository
{
    public function __construct(private PDO $pdo)
    {
}

    public function save(Member $member): int
    {
        if ($member->id) {
            $stmt = $this->pdo->prepare("
                UPDATE members 
                SET ref = :ref, type_id = :type_id, third_party_id = :third_party_id, 
                    first_name = :first_name, last_name = :last_name, company = :company, 
                    email = :email, status = :status, date_start = :date_start, date_end = :date_end
                WHERE id = :id
            ");
        } else {
            $stmt = $this->pdo->prepare("
                INSERT INTO members (ref, type_id, third_party_id, first_name, last_name, company, email, status, date_start, date_end)
                VALUES (:ref, :type_id, :third_party_id, :first_name, :last_name, :company, :email, :status, :date_start, :date_end)
            ");
        }
        
        $data = $member->toArray();
        unset($data['created_at'], $data['updated_at']);
        
        $stmt->execute($data);
        return $member->id ?? (int) $this->pdo->lastInsertId();
    }

    public function findById(int $id): ?Member
    {
        $stmt = $this->pdo->prepare("SELECT * FROM members WHERE id = :id");
        $stmt->execute(['id' => $id]);
        $data = $stmt->fetch();
        return $data ? Member::fromArray($data) : null;
    }

    public function findAll(int $limit = 500, int $offset = 0): array
    {
        $stmt = $this->pdo->prepare("SELECT * FROM members LIMIT :limit OFFSET :offset");
        $stmt->bindValue(':limit', $limit, PDO::PARAM_INT);
        $stmt->bindValue(':offset', $offset, PDO::PARAM_INT);
        $stmt->execute();
        
        $results = [];
        foreach ($stmt->fetchAll() as $data) {
            $results[] = Member::fromArray($data);
        }
        return $results;
    }

    public function delete(int $id): bool
    {
        $stmt = $this->pdo->prepare("DELETE FROM members WHERE id = :id");
        return $stmt->execute(['id' => $id]);
    }
}
