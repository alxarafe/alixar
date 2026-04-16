<?php

declare(strict_types=1);

namespace Plugin\Projects\Infrastructure\Persistence\Mysql\Task;

use PDO;
use Plugin\Projects\Domain\Task\Task;
use Plugin\Projects\Domain\Task\TaskRepository;

class MysqlTaskRepository implements TaskRepository
{
    private string $table = 'project_tasks';

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

    public function findById(int $id): ?Task
    {
        $stmt = $this->pdo->prepare("SELECT * FROM {$this->table} WHERE id = :id");
        $stmt->execute(['id' => $id]);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$row) return null;
        return $this->mapRowToEntity($row);
    }

    public function findByRef(string $ref): ?Task
    {
        $stmt = $this->pdo->prepare("SELECT * FROM {$this->table} WHERE ref = :ref");
        $stmt->execute(['ref' => $ref]);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$row) return null;
        return $this->mapRowToEntity($row);
    }
    
    public function findByProject(int $projectId): array
    {
        $stmt = $this->pdo->prepare("SELECT * FROM {$this->table} WHERE project_id = :id");
        $stmt->execute(['id' => $projectId]);
        
        $results = [];
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $results[] = $this->mapRowToEntity($row);
        }
        return $results;
    }

    public function save(Task $task): void
    {
        if ($task->getId() === null) {
            $this->insert($task);
        } else {
            $this->update($task);
        }
    }

    private function insert(Task $task): void
    {
        $data = $task->toArray();
        $mappedData = $this->mapEntityToRow($data);
        unset($mappedData['id'], $mappedData['updated_at']);

        $columns = array_keys($mappedData);
        $placeholders = array_map(fn($c) => ':' . $c, $columns);
        $sql = sprintf('INSERT INTO %s (%s) VALUES (%s)', $this->table, implode(', ', $columns), implode(', ', $placeholders));

        $this->pdo->prepare($sql)->execute($mappedData);
        $task->setId((int) $this->pdo->lastInsertId());
    }

    private function update(Task $task): void
    {
        $data = $task->toArray();
        $mappedData = $this->mapEntityToRow($data);
        $id = $mappedData['id'];
        unset($mappedData['id'], $mappedData['created_at']);

        $sets = array_map(fn($c) => "{$c} = :{$c}", array_keys($mappedData));
        $sql = sprintf('UPDATE %s SET %s WHERE id = :id', $this->table, implode(', ', $sets));

        $this->pdo->prepare($sql)->execute(['id' => $id] + $mappedData);
    }

    public function delete(int $id): void
    {
        $this->pdo->prepare("DELETE FROM {$this->table} WHERE id = :id")->execute(['id' => $id]);
    }

    private function mapRowToEntity(array $row): Task
    {
        return Task::fromArray([
            'id' => (int) $row['id'],
            'ref' => $row['ref'],
            'label' => $row['label'],
            'projectId' => (int) $row['project_id'],
            'description' => $row['description'],
            'dateStart' => $row['date_start'],
            'dateEnd' => $row['date_end'],
            'progress' => (int) $row['progress'],
            'priority' => (int) $row['priority'],
            'duration' => (float) $row['duration'],
            'parentId' => $row['parent_id'] ? (int) $row['parent_id'] : null,
            'status' => (int) $row['status'],
            'createdAt' => $row['created_at'],
            'updatedAt' => $row['updated_at']
        ]);
    }

    private function mapEntityToRow(array $data): array
    {
        return [
            'id' => $data['id'] !== null ? (int) $data['id'] : null,
            'ref' => $data['ref'],
            'label' => $data['label'],
            'project_id' => $data['projectId'],
            'description' => $data['description'],
            'date_start' => $data['dateStart'],
            'date_end' => $data['dateEnd'],
            'progress' => $data['progress'],
            'priority' => $data['priority'],
            'duration' => $data['duration'],
            'parent_id' => $data['parentId'],
            'status' => $data['status'],
            'created_at' => $data['createdAt'],
            'updated_at' => $data['updatedAt']
        ];
    }
}
