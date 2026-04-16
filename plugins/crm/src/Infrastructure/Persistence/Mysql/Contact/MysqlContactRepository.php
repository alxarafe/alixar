<?php

declare(strict_types=1);

namespace Plugin\Crm\Infrastructure\Persistence\Mysql\Contact;

use PDO;
use Plugin\Crm\Domain\Contact\Contact;
use Plugin\Crm\Domain\Contact\ContactRepository;

class MysqlContactRepository implements ContactRepository
{
    private string $table = 'contacts';

    public function __construct(private PDO $pdo)
    {
    }

    public function findById(int $id): ?Contact
    {
        $stmt = $this->pdo->prepare('SELECT * FROM ' . $this->table . ' WHERE id = :id');
        $stmt->execute(['id' => $id]);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        return $row ? $this->mapRow($row) : null;
    }

    public function findByEmail(string $email): ?Contact
    {
        $stmt = $this->pdo->prepare('SELECT * FROM ' . $this->table . ' WHERE email = :email LIMIT 1');
        $stmt->execute(['email' => $email]);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        return $row ? $this->mapRow($row) : null;
    }

    public function findAll(array $filters = [], int $limit = 100, int $offset = 0, string $sortField = 'id', string $sortOrder = 'ASC'): array
    {
        if ($sortField === 'rowid' || $sortField === 't.rowid') $sortField = 'id';
        $sortOrder = strtoupper($sortOrder) === 'DESC' ? 'DESC' : 'ASC';

        list($whereSql, $params) = $this->buildWhere($filters);

        $sql = sprintf(
            'SELECT * FROM %s %s ORDER BY %s %s LIMIT %d OFFSET %d',
            $this->table, $whereSql, $sortField, $sortOrder, $limit, $offset
        );
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute($params);
        $rows = $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];
        
        return array_map(fn($row) => $this->mapRow($row), $rows);
    }

    private function buildWhere(array $filters): array
    {
        $sqls = [];
        $params = [];
        if (!empty($filters['thirdparty_ids'])) {
            $ids = explode(',', $filters['thirdparty_ids']);
            $idPlaceholders = [];
            foreach ($ids as $i => $id) {
                $idPlaceholders[] = ':tp' . $i;
                $params['tp' . $i] = (int) trim($id);
            }
            $sqls[] = 'third_party_id IN (' . implode(',', $idPlaceholders) . ')';
        }
        return [$sqls ? 'WHERE ' . implode(' AND ', $sqls) : '', $params];
    }

    public function save(Contact $contact): void
    {
        $data = $this->camelToSnake($contact->toArray());
        
        if ($contact->getId() === null) {
            unset($data['id']);
            $columns = array_keys($data);
            $placeholders = array_map(fn($c) => ':' . $c, $columns);
            $sql = sprintf('INSERT INTO %s (%s) VALUES (%s)', $this->table, implode(', ', $columns), implode(', ', $placeholders));
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute($data);
            $contact->setId((int) $this->pdo->lastInsertId());
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

    private function mapRow(array $row): Contact
    {
        $data = [];
        foreach ($row as $k => $v) {
            $camelKeys = lcfirst(str_replace(' ', '', ucwords(str_replace('_', ' ', $k))));
            $data[$camelKeys] = $v;
        }
        return Contact::fromArray($data + ['id' => $row['id']]);
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
