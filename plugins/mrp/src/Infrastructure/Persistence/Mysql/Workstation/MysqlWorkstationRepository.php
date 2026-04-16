<?php

declare(strict_types=1);

namespace Plugin\Mrp\Infrastructure\Persistence\Mysql\Workstation;

use Plugin\Mrp\Domain\Workstation\Workstation;
use Plugin\Mrp\Domain\Workstation\WorkstationRepository;
use PDO;

class MysqlWorkstationRepository implements WorkstationRepository
{
    public function __construct(private PDO $pdo)
    {
}

    public function save(Workstation $ws): int
    {
        if ($ws->id) {
            $stmt = $this->pdo->prepare("
                UPDATE mrp_workstations 
                SET ref = :ref, label = :label, hourly_rate = :hourly_rate, status = :status
                WHERE id = :id
            ");
        } else {
            $stmt = $this->pdo->prepare("
                INSERT INTO mrp_workstations (ref, label, hourly_rate, status)
                VALUES (:ref, :label, :hourly_rate, :status)
            ");
        }
        
        $data = $ws->toArray();
        unset($data['created_at'], $data['updated_at']);
        
        $stmt->execute($data);
        return $ws->id ?? (int) $this->pdo->lastInsertId();
    }

    public function findById(int $id): ?Workstation
    {
        $stmt = $this->pdo->prepare("SELECT * FROM mrp_workstations WHERE id = :id");
        $stmt->execute(['id' => $id]);
        $data = $stmt->fetch();
        return $data ? Workstation::fromArray($data) : null;
    }

    public function findAll(int $limit = 500, int $offset = 0): array
    {
        $stmt = $this->pdo->prepare("SELECT * FROM mrp_workstations LIMIT :limit OFFSET :offset");
        $stmt->bindValue(':limit', $limit, PDO::PARAM_INT);
        $stmt->bindValue(':offset', $offset, PDO::PARAM_INT);
        $stmt->execute();
        
        $results = [];
        foreach ($stmt->fetchAll() as $data) {
            $results[] = Workstation::fromArray($data);
        }
        return $results;
    }

    public function delete(int $id): bool
    {
        $stmt = $this->pdo->prepare("DELETE FROM mrp_workstations WHERE id = :id");
        return $stmt->execute(['id' => $id]);
    }
}
