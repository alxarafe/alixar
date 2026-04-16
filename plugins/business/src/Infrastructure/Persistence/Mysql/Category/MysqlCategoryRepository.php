<?php

declare(strict_types=1);

namespace Plugin\Business\Infrastructure\Persistence\Mysql\Category;

use PDO;
use Plugin\Business\Domain\Category\Category;
use Plugin\Business\Domain\Category\CategoryRepository;

class MysqlCategoryRepository implements CategoryRepository
{
    private string $table = 'categories';
    private string $pivotPrefix = 'category_';

    public function __construct(private PDO $pdo)
    {
    }

    public function findAll(int $limit = 100, int $offset = 0, string $sortField = 'id', string $sortOrder = 'ASC'): array
    {
        $sortField = $sortField === 'rowid' || $sortField === 't.rowid' ? 'id' : $sortField;
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

    public function findById(int $id): ?Category
    {
        $stmt = $this->pdo->prepare("SELECT * FROM {$this->table} WHERE id = :id");
        $stmt->execute(['id' => $id]);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$row) return null;
        return $this->mapRowToEntity($row);
    }

    public function findByType(int $type): array
    {
        $stmt = $this->pdo->prepare("SELECT * FROM {$this->table} WHERE type = :type");
        $stmt->execute(['type' => $type]);
        
        $results = [];
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $results[] = $this->mapRowToEntity($row);
        }
        return $results;
    }

    public function findForObject(int $type, int $objectId): array
    {
        $pivotTable = $this->getPivotTable($type);
        if (!$pivotTable) return [];

        $sql = "SELECT c.* FROM {$this->table} c JOIN {$pivotTable} p ON c.id = p.category_id WHERE p.fk_object = :id";
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute(['id' => $objectId]);

        $results = [];
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            $results[] = $this->mapRowToEntity($row);
        }
        return $results;
    }

    public function linkObject(int $categoryId, int $type, int $objectId): void
    {
        $pivotTable = $this->getPivotTable($type);
        if (!$pivotTable) return;

        // Ignore duplicate key errors silently (like Dolibarr does)
        $sql = "INSERT IGNORE INTO {$pivotTable} (category_id, fk_object) VALUES (:cat, :obj)";
        $this->pdo->prepare($sql)->execute(['cat' => $categoryId, 'obj' => $objectId]);
    }
    
    public function unlinkObject(int $categoryId, int $type, int $objectId): void
    {
        $pivotTable = $this->getPivotTable($type);
        if (!$pivotTable) return;

        $sql = "DELETE FROM {$pivotTable} WHERE category_id = :cat AND fk_object = :obj";
        $this->pdo->prepare($sql)->execute(['cat' => $categoryId, 'obj' => $objectId]);
    }

    public function save(Category $category): void
    {
        if ($category->getId() === null) {
            $this->insert($category);
        } else {
            $this->update($category);
        }
    }

    private function insert(Category $category): void
    {
        $data = $category->toArray();
        $mappedData = $this->mapEntityToRow($data);
        unset($mappedData['id'], $mappedData['updated_at']);

        $columns = array_keys($mappedData);
        $placeholders = array_map(fn($c) => ':' . $c, $columns);
        $sql = sprintf(
            'INSERT INTO %s (%s) VALUES (%s)',
            $this->table, implode(', ', $columns), implode(', ', $placeholders)
        );

        $this->pdo->prepare($sql)->execute($mappedData);
        $category->setId((int) $this->pdo->lastInsertId());
    }

    private function update(Category $category): void
    {
        $data = $category->toArray();
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

    private function getPivotTable(int $type): ?string
    {
        $map = [
            0 => 'product',
            1 => 'supplier',
            2 => 'customer',
            3 => 'member',
            4 => 'contact',
            5 => 'project'
        ];
        if (!isset($map[$type])) return null;
        return $this->pivotPrefix . $map[$type];
    }

    private function mapRowToEntity(array $row): Category
    {
        return Category::fromArray([
            'id' => (int) $row['id'],
            'label' => $row['label'],
            'type' => (int) $row['type'],
            'description' => $row['description'],
            'color' => $row['color'],
            'position' => (int) $row['position'],
            'parentId' => $row['parent_id'] ? (int) $row['parent_id'] : null,
            'visible' => (int) $row['visible'],
            'createdAt' => $row['created_at'],
            'updatedAt' => $row['updated_at']
        ]);
    }

    private function mapEntityToRow(array $data): array
    {
        return [
            'id' => $data['id'] !== null ? (int) $data['id'] : null,
            'label' => $data['label'],
            'type' => $data['type'],
            'description' => $data['description'],
            'color' => $data['color'],
            'position' => $data['position'],
            'parent_id' => $data['parentId'],
            'visible' => $data['visible'],
            'created_at' => $data['createdAt'],
            'updated_at' => $data['updatedAt']
        ];
    }
}
