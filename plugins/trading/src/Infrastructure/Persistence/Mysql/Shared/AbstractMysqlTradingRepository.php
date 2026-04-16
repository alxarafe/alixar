<?php

declare(strict_types=1);

namespace Plugin\Trading\Infrastructure\Persistence\Mysql\Shared;

use PDO;
use RuntimeException;

abstract class AbstractMysqlTradingRepository
{
    public function __construct(protected PDO $pdo)
    {
    }

    protected function findByIdBase(int $id, string $table): ?array
    {
        $stmt = $this->pdo->prepare('SELECT * FROM ' . $table . ' WHERE id = :id');
        $stmt->execute(['id' => $id]);
        return $stmt->fetch(PDO::FETCH_ASSOC) ?: null;
    }

    protected function findByRefBase(string $ref, string $table): ?array
    {
        $stmt = $this->pdo->prepare('SELECT * FROM ' . $table . ' WHERE ref = :r');
        $stmt->execute(['r' => $ref]);
        return $stmt->fetch(PDO::FETCH_ASSOC) ?: null;
    }

    protected function deleteBase(int $id, string $table): void
    {
        $stmt = $this->pdo->prepare('DELETE FROM ' . $table . ' WHERE id = :id');
        $stmt->execute(['id' => $id]);
    }

    // Helper for lines
    protected function getLinesBase(int $parentId, string $table, string $fkColumn): array
    {
        $stmt = $this->pdo->prepare('SELECT * FROM ' . $table . ' WHERE ' . $fkColumn . ' = :id');
        $stmt->execute(['id' => $parentId]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];
    }

    protected function addLineBase(int $parentId, array $data, string $table, string $fkColumn): void
    {
        $data[$fkColumn] = $parentId;
        $columns = array_keys($data);
        $placeholders = array_map(fn($c) => ':' . $c, $columns);
        
        $sql = sprintf(
            'INSERT INTO %s (%s) VALUES (%s)',
            $table,
            implode(', ', $columns),
            implode(', ', $placeholders)
        );

        $stmt = $this->pdo->prepare($sql);
        $stmt->execute($data);
    }

    protected function updateLineBase(int $parentId, int $lineId, array $data, string $table, string $fkColumn): void
    {
        $sets = array_map(fn($c) => "{$c} = :{$c}", array_keys($data));
        
        $sql = sprintf(
            'UPDATE %s SET %s WHERE id = :id AND %s = :fk',
            $table,
            implode(', ', $sets),
            $fkColumn
        );

        $data['id'] = $lineId;
        $data['fk'] = $parentId;
        
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute($data);
    }

    protected function deleteLineBase(int $parentId, int $lineId, string $table, string $fkColumn): void
    {
        $stmt = $this->pdo->prepare('DELETE FROM ' . $table . ' WHERE id = :id AND ' . $fkColumn . ' = :fk');
        $stmt->execute(['id' => $lineId, 'fk' => $parentId]);
    }

    // Contacts 
    protected function getContactsBase(int $parentId, string $table, string $fkColumn, string $type = ''): array
    {
        $sql = 'SELECT * FROM ' . $table . ' WHERE ' . $fkColumn . ' = :id';
        $params = ['id' => $parentId];
        
        if ($type !== '') {
            $sql .= ' AND type = :t';
            $params['t'] = $type;
        }
        
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute($params);
        return $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];
    }

    protected function addContactBase(int $parentId, int $contactId, string $type, string $table, string $fkColumn): void
    {
        $stmt = $this->pdo->prepare('INSERT IGNORE INTO ' . $table . ' (' . $fkColumn . ', contact_id, type) VALUES (:id, :cid, :t)');
        $stmt->execute(['id' => $parentId, 'cid' => $contactId, 't' => $type]);
    }

    protected function deleteContactBase(int $parentId, int $contactId, string $type, string $table, string $fkColumn): void
    {
        $stmt = $this->pdo->prepare('DELETE FROM ' . $table . ' WHERE ' . $fkColumn . ' = :id AND contact_id = :cid AND type = :t');
        $stmt->execute(['id' => $parentId, 'cid' => $contactId, 't' => $type]);
    }

    protected function camelToSnake(array $data): array
    {
        $mapped = [];
        foreach ($data as $k => $v) {
            $snake = strtolower((string) preg_replace('/(?<!^)[A-Z]/', '_$0', $k));
            $mapped[$snake] = $v;
        }
        return $mapped;
    }
}
