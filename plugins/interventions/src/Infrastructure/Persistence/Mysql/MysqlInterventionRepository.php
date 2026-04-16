<?php

declare(strict_types=1);

namespace Plugin\Interventions\Infrastructure\Persistence\Mysql;

use Plugin\Interventions\Domain\Intervention\Intervention;
use Plugin\Interventions\Domain\Intervention\InterventionRepository;

class MysqlInterventionRepository implements InterventionRepository
{
    private string $tableName;

    public function __construct(
        private \PDO $pdo,
        string $prefix = ''
    ) {
        $this->tableName = $prefix . 'interventions';
    }

    public function findById(int $id): ?Intervention
    {
        $stmt = $this->pdo->prepare("SELECT * FROM {$this->tableName} WHERE id = :id");
        $stmt->execute(['id' => $id]);
        $row = $stmt->fetch();

        if (!$row) {
            return null;
        }

        return $this->mapRowToEntity($row);
    }

    public function findByRef(string $ref): ?Intervention
    {
        $stmt = $this->pdo->prepare("SELECT * FROM {$this->tableName} WHERE ref = :ref");
        $stmt->execute(['ref' => $ref]);
        $row = $stmt->fetch();

        if (!$row) {
            return null;
        }

        return $this->mapRowToEntity($row);
    }

    public function count(array $criteria = []): int
    {
        $stmt = $this->pdo->query("SELECT COUNT(*) FROM {$this->tableName}");
        return (int) $stmt->fetchColumn();
    }

    public function findAll(int $limit = 100, int $offset = 0, string $sortField = 'id', string $sortOrder = 'ASC'): array
    {
        $allowedFields = ['id', 'ref', 'third_party_id', 'status', 'date_creation'];
        if (!in_array($sortField, $allowedFields)) {
            $sortField = 'id';
        }
        $sortOrder = strtoupper($sortOrder) === 'DESC' ? 'DESC' : 'ASC';

        $stmt = $this->pdo->prepare("SELECT * FROM {$this->tableName} ORDER BY {$sortField} {$sortOrder} LIMIT :limit OFFSET :offset");
        $stmt->bindValue(':limit', $limit, \PDO::PARAM_INT);
        $stmt->bindValue(':offset', $offset, \PDO::PARAM_INT);
        $stmt->execute();

        $results = [];
        while ($row = $stmt->fetch()) {
            $results[] = $this->mapRowToEntity($row);
        }

        return $results;
    }

    public function save(Intervention $intervention): void
    {
        if ($intervention->getId() === null) {
            $this->insert($intervention);
        } else {
            $this->update($intervention);
        }
    }

    public function delete(int $id): void
    {
        $stmt = $this->pdo->prepare("DELETE FROM {$this->tableName} WHERE id = :id");
        $stmt->execute(['id' => $id]);
    }

    private function insert(Intervention $item): void
    {
        $sql = "INSERT INTO {$this->tableName} 
                (ref, ref_ext, third_party_id, status, title, date_creation, date_valid, date_start, date_end, description, note_private, note_public, project_id) 
                VALUES 
                (:ref, :ref_ext, :third_party_id, :status, :title, :date_creation, :date_valid, :date_start, :date_end, :description, :note_private, :note_public, :project_id)";

        $stmt = $this->pdo->prepare($sql);
        $params = $this->extractParams($item);
        $stmt->execute($params);

        $item->setId((int)$this->pdo->lastInsertId());
    }

    private function update(Intervention $item): void
    {
        $sql = "UPDATE {$this->tableName} SET 
                ref = :ref, ref_ext = :ref_ext, third_party_id = :third_party_id, status = :status, title = :title, date_creation = :date_creation, 
                date_valid = :date_valid, date_start = :date_start, date_end = :date_end, description = :description, 
                note_private = :note_private, note_public = :note_public, project_id = :project_id
                WHERE id = :id";

        $stmt = $this->pdo->prepare($sql);
        $params = $this->extractParams($item);
        $params['id'] = $item->getId();
        $stmt->execute($params);
    }

    private function mapRowToEntity(array $row): Intervention
    {
        return Intervention::fromArray([
            'id' => (int) $row['id'],
            'ref' => $row['ref'],
            'refExt' => $row['ref_ext'],
            'thirdPartyId' => (int) $row['third_party_id'],
            'status' => (int) $row['status'],
            'title' => $row['title'],
            'dateCreation' => $row['date_creation'],
            'dateValid' => $row['date_valid'],
            'dateStart' => $row['date_start'],
            'dateEnd' => $row['date_end'],
            'description' => $row['description'],
            'notePrivate' => $row['note_private'],
            'notePublic' => $row['note_public'],
            'projectId' => isset($row['project_id']) ? (int) $row['project_id'] : null,
        ]);
    }

    private function extractParams(Intervention $item): array
    {
        $arr = $item->toArray();
        return [
            'ref' => $arr['ref'] ?? null,
            'ref_ext' => $arr['refExt'] ?? null,
            'third_party_id' => $arr['thirdPartyId'] ?? 0,
            'status' => $arr['status'] ?? 0,
            'title' => $arr['title'] ?? null,
            'date_creation' => $arr['dateCreation'] ?? null,
            'date_valid' => $arr['dateValid'] ?? null,
            'date_start' => $arr['dateStart'] ?? null,
            'date_end' => $arr['dateEnd'] ?? null,
            'description' => $arr['description'] ?? null,
            'note_private' => $arr['notePrivate'] ?? null,
            'note_public' => $arr['notePublic'] ?? null,
            'project_id' => $arr['projectId'] ?? null,
        ];
    }
}
