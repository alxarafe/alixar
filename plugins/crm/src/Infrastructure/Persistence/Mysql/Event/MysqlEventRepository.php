<?php

declare(strict_types=1);

namespace Plugin\Crm\Infrastructure\Persistence\Mysql\Event;

use PDO;
use Plugin\Crm\Domain\Event\Event;
use Plugin\Crm\Domain\Event\EventRepository;

class MysqlEventRepository implements EventRepository
{
    private string $table = 'events';

    public function __construct(private PDO $pdo)
    {
    }

    public function findById(int $id): ?Event
    {
        $stmt = $this->pdo->prepare('SELECT * FROM ' . $this->table . ' WHERE id = :id');
        $stmt->execute(['id' => $id]);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        return $row ? $this->mapRow($row) : null;
    }

    public function count(array $criteria = []): int
    {
        $stmt = $this->pdo->query('SELECT COUNT(*) FROM ' . $this->table);
        return (int) ($stmt ? $stmt->fetchColumn() : 0);
    }

    public function findAll(int $limit = 100, int $offset = 0, string $sortField = 'date_start', string $sortOrder = 'DESC'): array
    {
        if ($sortField === 'rowid' || $sortField === 't.rowid') $sortField = 'id';
        if ($sortField === 'datep') $sortField = 'date_start';
        $sortOrder = strtoupper($sortOrder) === 'DESC' ? 'DESC' : 'ASC';

        $sql = sprintf(
            'SELECT * FROM %s ORDER BY %s %s LIMIT %d OFFSET %d',
            $this->table, $sortField, $sortOrder, $limit, $offset
        );
        $stmt = $this->pdo->query($sql);
        $rows = $stmt ? $stmt->fetchAll(PDO::FETCH_ASSOC) : [];
        return array_map(fn($row) => $this->mapRow($row), $rows);
    }

    public function save(Event $event): void
    {
        $data = $this->camelToSnake($event->toArray());
        
        if ($event->getId() === null) {
            unset($data['id']);
            $columns = array_keys($data);
            $placeholders = array_map(fn($c) => ':' . $c, $columns);
            $sql = sprintf('INSERT INTO %s (%s) VALUES (%s)', $this->table, implode(', ', $columns), implode(', ', $placeholders));
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute($data);
            $event->setId((int) $this->pdo->lastInsertId());
        } else {
            $id = $data['id'];
            unset($data['id'], $data['created_at']);
            $sets = array_map(fn($c) => "{$c} = :{$c}", array_keys($data));
            $sql = sprintf('UPDATE %s SET %s WHERE id = :id', $this->table, implode(', ', $sets));
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute(['id' => $id] + $data);
        }
    }

    public function delete(int $id): void
    {
        $stmt = $this->pdo->prepare('DELETE FROM ' . $this->table . ' WHERE id = :id');
        $stmt->execute(['id' => $id]);
    }

    private function mapRow(array $row): Event
    {
        $data = [];
        foreach ($row as $k => $v) {
            $camelKeys = lcfirst(str_replace(' ', '', ucwords(str_replace('_', ' ', $k))));
            $data[$camelKeys] = $v;
        }
        return Event::fromArray($data + ['id' => $row['id']]);
    }

    private function camelToSnake(array $data): array
    {
        $mapped = [];
        foreach ($data as $k => $v) {
            $snake = strtolower((string) preg_replace('/(?<!^)[A-Z]/', '_$0', $k));
            $mapped[$snake] = $v;
        }
        return $mapped;
    }
}
