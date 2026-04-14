<?php

declare(strict_types=1);

namespace Plugin\Projects\Infrastructure\Persistence\Mysql;

use Plugin\Projects\Domain\Project\Project;
use Plugin\Projects\Domain\Project\ProjectRepository;
use Plugin\DolibarrCompat\Infrastructure\DolibarrMappingTrait;
use PDO;

class MysqlProjectRepository implements ProjectRepository
{
    use DolibarrMappingTrait;

    private string $table;

    // Dolibarr's 'llx_projet'
    private const COLUMN_MAP = [
        'id' => 'id',
        'thirdPartyId' => 'fk_soc',
        'ref' => 'ref',
        'refExt' => 'ref_ext',
        'title' => 'title',
        'status' => 'fk_statut',
        'createdAt' => 'datec',
        'updatedAt' => 'tms',
        'dateStartEvent' => 'date_start_event',
        'dateEndEvent' => 'date_end_event',
    ];

    public function __construct(private PDO $pdo, string $prefix = 'llx_')
    {
        $this->table = $prefix . 'projet';
    }

    /**
     * @return array<Project>
     */
    #[\Override]
    public function findAll(int $limit = 100, int $offset = 0, string $sortField = 'id', string $sortOrder = 'ASC'): array
    {
        $allowedSortFields = array_values(self::COLUMN_MAP);
        if (!in_array($sortField, $allowedSortFields, true)) {
            $sortField = 'id';
        }

        $sortOrder = strtoupper($sortOrder) === 'DESC' ? 'DESC' : 'ASC';

        $sql = sprintf('SELECT * FROM %s ORDER BY %s %s LIMIT %d OFFSET %d', $this->table, $sortField, $sortOrder, $limit, $offset);
        $stmt = $this->pdo->query($sql);
        
        if (!$stmt) return [];
        $rows = $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];

        $projects = [];
        foreach ($rows as $row) {
            $projects[] = Project::fromArray($this->mapToClean($row, self::COLUMN_MAP));
        }

        return $projects;
    }

    /**
     * @param array<string, mixed> $criteria
     */
    #[\Override]
    public function count(array $criteria = []): int
    {
        $stmt = $this->pdo->query('SELECT COUNT(*) FROM ' . $this->table);
        if (!$stmt) return 0;
        return (int) $stmt->fetchColumn();
    }

    #[\Override]
    public function findById(int $id): ?Project
    {
        $stmt = $this->pdo->prepare('SELECT * FROM ' . $this->table . ' WHERE id = :id');
        $stmt->execute(['id' => $id]);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$row) return null;

        return Project::fromArray($this->mapToClean($row, self::COLUMN_MAP));
    }

    #[\Override]
    public function findByRef(string $ref): ?Project
    {
        $stmt = $this->pdo->prepare('SELECT * FROM ' . $this->table . ' WHERE ref = :ref');
        $stmt->execute(['ref' => $ref]);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$row) return null;

        return Project::fromArray($this->mapToClean($row, self::COLUMN_MAP));
    }

    #[\Override]
    public function save(Project $project): void
    {
        $dbData = $this->mapToDolibarr($project->toArray(), self::COLUMN_MAP);
        unset($dbData['tms']);

        if ($project->getId() === null) {
            unset($dbData['id']);
            $dbData['entity'] = 1;
            $dbData['fk_user_creat'] = 1; // Strict mode bypass

            // Si la ref es (PROV), usamos una temporal única para evitar UK_projet_ref (ref, entity)
            if (($dbData['ref'] ?? '') === '(PROV)') {
                $dbData['ref'] = '(PROV' . bin2hex(random_bytes(4)) . ')';
            }

            $columns = array_keys($dbData);
            $placeholders = array_map(fn($c) => ':' . $c, $columns);

            $sql = sprintf('INSERT INTO %s (%s) VALUES (%s)', $this->table, implode(', ', $columns), implode(', ', $placeholders));
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute($dbData);
            
            $project->setId((int) $this->pdo->lastInsertId());

            // Actualizar a la definitiva (PROV{ID}) si era provisional
            if (str_starts_with($dbData['ref'], '(PROV')) {
                $finalProvRef = '(PROV' . $project->getId() . ')';
                $this->pdo->prepare("UPDATE {$this->table} SET ref = ? WHERE id = ?")
                    ->execute([$finalProvRef, $project->getId()]);
            }
        } else {
            $id = $dbData['id'];
            unset($dbData['id']);
            unset($dbData['datec']);

            $sets = array_map(fn($c) => "{$c} = :{$c}", array_keys($dbData));

            $sql = sprintf('UPDATE %s SET %s WHERE id = :id', $this->table, implode(', ', $sets));
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute(['id' => $id] + $dbData);
        }
    }

    #[\Override]
    public function delete(int $id): void
    {
        $stmt = $this->pdo->prepare('DELETE FROM ' . $this->table . ' WHERE id = :id');
        $stmt->execute(['id' => $id]);
    }

    // --- Tasks (llx_projet_task) ---
    #[\Override]
    public function getTasks(int $projectId): array
    {
        $stmt = $this->pdo->prepare("SELECT * FROM {$this->table}_task WHERE fk_projet = :id");
        $stmt->execute(['id' => $projectId]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];
    }

    #[\Override]
    public function addTask(int $projectId, array $data): void
    {
        $data['fk_projet'] = $projectId;
        if (!isset($data['ref'])) $data['ref'] = 'TASK-' . time();
        if (!isset($data['label'])) $data['label'] = 'New Task';
        if (!isset($data['progress'])) $data['progress'] = 0;
        
        $columns = array_keys($data);
        $placeholders = array_map(fn($c) => ':' . $c, $columns);
        $sql = sprintf("INSERT INTO {$this->table}_task (%s) VALUES (%s)", implode(', ', $columns), implode(', ', $placeholders));
        
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute($data);
    }

    #[\Override]
    public function updateTask(int $projectId, int $taskId, array $data): void
    {
        unset($data['id']);
        unset($data['fk_projet']);

        $sets = array_map(fn($c) => "{$c} = :{$c}", array_keys($data));
        $sql = sprintf("UPDATE {$this->table}_task SET %s WHERE id = :taskId AND fk_projet = :projectId", implode(', ', $sets));
        
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute(['taskId' => $taskId, 'projectId' => $projectId] + $data);
    }

    #[\Override]
    public function deleteTask(int $projectId, int $taskId): void
    {
        $stmt = $this->pdo->prepare("DELETE FROM {$this->table}_task WHERE id = :taskId AND fk_projet = :projectId");
        $stmt->execute(['taskId' => $taskId, 'projectId' => $projectId]);
    }
}
