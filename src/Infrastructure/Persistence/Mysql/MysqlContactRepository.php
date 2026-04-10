<?php

declare(strict_types=1);

namespace App\Infrastructure\Persistence\Mysql;

use App\Domain\Contact\Contact;
use App\Domain\Contact\ContactRepository;
use PDO;

/**
 * MysqlContactRepository — PDO adapter for the Dolibarr `socpeople` table.
 *
 * Lo "curioso": la tabla usa `id` como PK (no `rowid` como societe).
 */
class MysqlContactRepository implements ContactRepository
{
    private string $table;

    public function __construct(
        private PDO $pdo,
        string $tablePrefix = '',
    ) {
        $this->table = $tablePrefix . 'socpeople';
    }

    public function findById(int $id): ?Contact
    {
        $stmt = $this->pdo->prepare(
            'SELECT * FROM ' . $this->table . ' WHERE rowid = :id LIMIT 1'
        );
        $stmt->execute(['id' => $id]);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        return $row ? Contact::fromArray($row) : null;
    }

    public function save(Contact $contact): void
    {
        $data = $contact->toArray();

        if ($contact->getId() === null) {
            unset($data['rowid']);
            $columns = array_keys($data);
            $placeholders = array_map(fn($c) => ':' . $c, $columns);

            $sql = sprintf(
                'INSERT INTO %s (%s) VALUES (%s)',
                $this->table,
                implode(', ', $columns),
                implode(', ', $placeholders)
            );

            $stmt = $this->pdo->prepare($sql);
            $stmt->execute($data);
            $contact->setId((int) $this->pdo->lastInsertId());
        } else {
            $id = $data['rowid'];
            unset($data['rowid']);
            $sets = array_map(fn($c) => "{$c} = :{$c}", array_keys($data));

            $sql = sprintf(
                'UPDATE %s SET %s WHERE rowid = :id',
                $this->table,
                implode(', ', $sets)
            );

            $data['rowid'] = $id;
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute(['id' => $id] + $data);
        }
    }

    public function delete(int $id): void
    {
        $stmt = $this->pdo->prepare(
            'DELETE FROM ' . $this->table . ' WHERE rowid = :id'
        );
        $stmt->execute(['id' => $id]);
    }

    /**
     * @return Contact[]
     */
    public function findAll(
        array $filters = [],
        int $limit = 100,
        int $offset = 0,
        string $sortField = 't.rowid',
        string $sortOrder = 'ASC',
    ): array {
        $where = ['1=1'];
        $params = [];

        // Filter by ThirdParty
        if (!empty($filters['thirdparty_ids'])) {
            $ids = array_map('intval', explode(',', $filters['thirdparty_ids']));
            $placeholders = implode(',', $ids);
            $where[] = "t.fk_soc IN ({$placeholders})";
        }

        $allowedSort = ['t.rowid', 't.lastname', 't.firstname', 't.datec', 't.town'];
        if (!in_array($sortField, $allowedSort, true)) {
            $sortField = 't.rowid';
        }
        $sortOrder = strtoupper($sortOrder) === 'DESC' ? 'DESC' : 'ASC';

        $sql = sprintf(
            'SELECT * FROM %s AS t WHERE %s ORDER BY %s %s LIMIT %d OFFSET %d',
            $this->table,
            implode(' AND ', $where),
            $sortField,
            $sortOrder,
            $limit,
            $offset
        );

        $stmt = $this->pdo->prepare($sql);
        $stmt->execute($params);
        $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

        return array_map(fn(array $row) => Contact::fromArray($row), $rows);
    }
}
