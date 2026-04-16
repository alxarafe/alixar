<?php

declare(strict_types=1);

namespace Plugin\Hr\Infrastructure\Persistence\Mysql\Recruitment;

use Plugin\Hr\Domain\Recruitment\Recruitment;
use Plugin\Hr\Domain\Recruitment\RecruitmentRepository;
use PDO;

class MysqlRecruitmentRepository implements RecruitmentRepository
{
    public function __construct(private PDO $pdo)
    {
}

    public function save(Recruitment $rec): int
    {
        if ($rec->id) {
            $stmt = $this->pdo->prepare("
                UPDATE hr_recruitments 
                SET ref = :ref, position_id = :position_id, candidate_first_name = :candidate_first_name, 
                    candidate_last_name = :candidate_last_name, candidate_email = :candidate_email, 
                    status = :status, notes = :notes
                WHERE id = :id
            ");
        } else {
            $stmt = $this->pdo->prepare("
                INSERT INTO hr_recruitments (ref, position_id, candidate_first_name, candidate_last_name, candidate_email, status, notes)
                VALUES (:ref, :position_id, :candidate_first_name, :candidate_last_name, :candidate_email, :status, :notes)
            ");
        }
        
        $data = $rec->toArray();
        unset($data['created_at'], $data['updated_at']);
        
        $stmt->execute($data);
        return $rec->id ?? (int) $this->pdo->lastInsertId();
    }

    public function findById(int $id): ?Recruitment
    {
        $stmt = $this->pdo->prepare("SELECT * FROM hr_recruitments WHERE id = :id");
        $stmt->execute(['id' => $id]);
        $data = $stmt->fetch();
        return $data ? Recruitment::fromArray($data) : null;
    }

    public function findAll(int $limit = 500, int $offset = 0): array
    {
        $stmt = $this->pdo->prepare("SELECT * FROM hr_recruitments LIMIT :limit OFFSET :offset");
        $stmt->bindValue(':limit', $limit, PDO::PARAM_INT);
        $stmt->bindValue(':offset', $offset, PDO::PARAM_INT);
        $stmt->execute();
        
        $results = [];
        foreach ($stmt->fetchAll() as $data) {
            $results[] = Recruitment::fromArray($data);
        }
        return $results;
    }

    public function delete(int $id): bool
    {
        $stmt = $this->pdo->prepare("DELETE FROM hr_recruitments WHERE id = :id");
        return $stmt->execute(['id' => $id]);
    }
}
