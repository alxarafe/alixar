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
    use \App\Infrastructure\DolibarrMappingTrait;

    private const COLUMN_MAP = [
        'id' => 'rowid',
        'thirdPartyId' => 'fk_soc',
        'countryId' => 'fk_pays',
        'phonePerso' => 'phone_perso',
        'phoneMobile' => 'phone_mobile',
        'jobTitle' => 'poste',
        'notePrivate' => 'note_private',
        'notePublic' => 'note_public',
        'isPrivate' => 'priv',
        'createdAt' => 'datec',
    ];
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

        return $row ? Contact::fromArray($this->mapToClean($row, self::COLUMN_MAP)) : null;
    }

    public function save(Contact $contact): void
    {
        $data = $contact->toArray();
        $dbData = $this->mapToDolibarr($data, self::COLUMN_MAP);
        $dbData['statut'] = 1;
        $dbData['fk_user_creat'] = 1;

        if ($contact->getId() === null) {
            // INSERT
            unset($dbData['rowid']);
            $columns = array_keys($dbData);
            $placeholders = array_map(fn($c) => ':' . $c, $columns);

            $sql = sprintf(
                'INSERT INTO %s (%s) VALUES (%s)',
                $this->table,
                implode(', ', $columns),
                implode(', ', $placeholders)
            );

            $stmt = $this->pdo->prepare($sql);
            $stmt->execute($dbData);
            $contact->setId((int) $this->pdo->lastInsertId());
        } else {
            // UPDATE
            $id = $dbData['rowid'];
            unset($dbData['rowid']);
            $sets = array_map(fn($c) => "{$c} = :{$c}", array_keys($dbData));

            $sql = sprintf(
                'UPDATE %s SET %s WHERE rowid = :rowid',
                $this->table,
                implode(', ', $sets)
            );

            $dbData['rowid'] = $id;
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute($dbData);
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

        return array_map(fn(array $row) => Contact::fromArray($this->mapToClean($row, self::COLUMN_MAP)), $rows);
    }

    public function findByEmail(string $email): ?Contact
    {
        $stmt = $this->pdo->prepare(
            'SELECT * FROM ' . $this->table . ' WHERE email = :email LIMIT 1'
        );
        $stmt->execute(['email' => $email]);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        return $row ? Contact::fromArray($this->mapToClean($row, self::COLUMN_MAP)) : null;
    }
}
