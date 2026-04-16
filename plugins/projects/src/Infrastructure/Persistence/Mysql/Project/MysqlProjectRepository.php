<?php

declare(strict_types=1);

namespace Plugin\Projects\Infrastructure\Persistence\Mysql\Project;

use PDO;
use Plugin\Projects\Domain\Project\Project;
use Plugin\Projects\Domain\Project\ProjectRepository;
use RuntimeException;

class MysqlProjectRepository implements ProjectRepository
{
    private string $table = 'projects';
    private string $tasksTable = 'project_tasks';

    public function __construct(private PDO $pdo)
    {
    }

    public function findAll(int $limit = 100, int $offset = 0, string $sortField = 'id', string $sortOrder = 'ASC'): array
    {
        $sortField = $sortField === 'rowid' ? 'id' : $sortField;
        $sql = "SELECT * FROM {$this->table} ORDER BY {$sortField} {$sortOrder} LIMIT {$limit} OFFSET {$offset}";
        $stmt = $this->pdo->query($sql);

        $results = [];
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $results[] = $this->mapRowToEntity($row);
        }

        return $results;
    }

    public function count(array $criteria = []): int
    {
        $stmt = $this->pdo->query("SELECT COUNT(*) FROM {$this->table}");
        return (int) $stmt->fetchColumn();
    }

    public function findById(int $id): ?Project
    {
        $stmt = $this->pdo->prepare("SELECT * FROM {$this->table} WHERE id = :id");
        $stmt->execute(['id' => $id]);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$row) {
            return null;
        }

        return $this->mapRowToEntity($row);
    }

    public function findByRef(string $ref): ?Project
    {
        $stmt = $this->pdo->prepare("SELECT * FROM {$this->table} WHERE ref = :ref");
        $stmt->execute(['ref' => $ref]);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$row) {
            return null;
        }

        return $this->mapRowToEntity($row);
    }

    public function save(Project $project): void
    {
        if ($project->getId() === null) {
            $this->insert($project);
        } else {
            $this->update($project);
        }
    }

    private function insert(Project $project): void
    {
        $data = $project->toArray();
        $mappedData = $this->mapEntityToRow($data);
        unset($mappedData['id'], $mappedData['updated_at']);

        $columns = array_keys($mappedData);
        $placeholders = array_map(fn($c) => ':' . $c, $columns);

        $sql = sprintf(
            'INSERT INTO %s (%s) VALUES (%s)',
            $this->table,
            implode(', ', $columns),
            implode(', ', $placeholders)
        );

        $stmt = $this->pdo->prepare($sql);
        $stmt->execute($mappedData);
        
        $project->setId((int) $this->pdo->lastInsertId());
    }

    private function update(Project $project): void
    {
        $data = $project->toArray();
        $mappedData = $this->mapEntityToRow($data);
        $id = $mappedData['id'];
        unset($mappedData['id'], $mappedData['created_at']);

        $sets = array_map(fn($c) => "{$c} = :{$c}", array_keys($mappedData));

        $sql = sprintf(
            'UPDATE %s SET %s WHERE id = :id',
            $this->table,
            implode(', ', $sets)
        );

        $stmt = $this->pdo->prepare($sql);
        $stmt->execute(['id' => $id] + $mappedData);
    }

    public function delete(int $id): void
    {
        $stmt = $this->pdo->prepare("DELETE FROM {$this->table} WHERE id = :id");
        $stmt->execute(['id' => $id]);
    }

    // --- Tasks ---

    public function getTasks(int $projectId): array
    {
        $stmt = $this->pdo->prepare("SELECT * FROM {$this->tasksTable} WHERE project_id = :id");
        $stmt->execute(['id' => $projectId]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];
    }

    public function addTask(int $projectId, array $data): void
    {
        $data['project_id'] = $projectId;
        $columns = array_keys($data);
        $placeholders = array_map(fn($c) => ':' . $c, $columns);
        $sql = sprintf('INSERT INTO %s (%s) VALUES (%s)', $this->tasksTable, implode(', ', $columns), implode(', ', $placeholders));
        $this->pdo->prepare($sql)->execute($data);
    }

    public function updateTask(int $projectId, int $taskId, array $data): void
    {
        $sets = array_map(fn($c) => "{$c} = :{$c}", array_keys($data));
        $sql = sprintf('UPDATE %s SET %s WHERE id = :id AND project_id = :pid', $this->tasksTable, implode(', ', $sets));
        $data['id'] = $taskId;
        $data['pid'] = $projectId;
        $this->pdo->prepare($sql)->execute($data);
    }

    public function deleteTask(int $projectId, int $taskId): void
    {
        $stmt = $this->pdo->prepare("DELETE FROM {$this->tasksTable} WHERE id = :id AND project_id = :pid");
        $stmt->execute(['id' => $taskId, 'pid' => $projectId]);
    }

    // --- Mappers ---

    private function mapRowToEntity(array $row): Project
    {
        return Project::fromArray([
            'id' => (int) $row['id'],
            'thirdPartyId' => $row['third_party_id'] !== null ? (int) $row['third_party_id'] : null,
            'ref' => $row['ref'],
            'refExt' => $row['ref_ext'],
            'title' => $row['title'],
            'status' => (int) $row['status'],
            'dateStartEvent' => $row['date_start_event'],
            'dateEndEvent' => $row['date_end_event'],
            'createdAt' => $row['created_at'],
            'updatedAt' => $row['updated_at']
        ]);
    }

    private function mapEntityToRow(array $data): array
    {
        return [
            'id' => $data['id'] !== null ? (int) $data['id'] : null,
            'third_party_id' => $data['thirdPartyId'],
            'ref' => $data['ref'],
            'ref_ext' => $data['refExt'],
            'title' => $data['title'],
            'status' => $data['status'],
            'date_start_event' => $data['dateStartEvent'],
            'date_end_event' => $data['dateEndEvent'],
            'created_at' => $data['createdAt'],
            'updated_at' => $data['updatedAt']
        ];
    }
}
