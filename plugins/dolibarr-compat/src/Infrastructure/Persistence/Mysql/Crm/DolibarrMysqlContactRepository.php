<?php

declare(strict_types=1);

namespace Plugin\DolibarrCompat\Infrastructure\Persistence\Mysql\Crm;

use Plugin\Crm\Domain\Contact\Contact;
use Plugin\Crm\Domain\Contact\ContactRepository;
use PDO;

/**
 * DolibarrMysqlContactRepository — PDO adapter for the Dolibarr `socpeople` table.
 *
 * This implements the pure ContactRepository from CRM but reads/writes
 * physically to the legacy `socpeople` table in Dolibarr.
 */
class DolibarrMysqlContactRepository implements ContactRepository
{
    use \Plugin\DolibarrCompat\Infrastructure\DolibarrMappingTrait;

    private const COLUMN_MAP = [
        'id' => 'rowid',
        'thirdPartyId' => 'fk_soc',
        'firstname' => 'firstname',
        'lastname' => 'lastname',
        'civility' => 'civility',
        'address' => 'address',
        'zip' => 'zip',
        'town' => 'town',
        'countryId' => 'fk_pays',
        'phone' => 'phone',
        'phonePerso' => 'phone_perso',
        'phoneMobile' => 'phone_mobile',
        'fax' => 'fax',
        'email' => 'email',
        'jobTitle' => 'poste',
        'notePrivate' => 'note_private',
        'notePublic' => 'note_public',
        'isPrivate' => 'priv',
        'createdAt' => 'datec',
        'entity' => 'entity',
    ];
    private string $table;

    public function __construct(
        private PDO $pdo,
        string $tablePrefix = 'llx_',
    ) {
        $prefix = $tablePrefix ?: 'llx_';
        $this->table = $prefix . 'socpeople';
    }

    #[\Override]
    public function findById(int $id): ?Contact
    {
        $stmt = $this->pdo->prepare(
            'SELECT * FROM ' . $this->table . ' WHERE rowid = :id AND entity IN (0, 1) LIMIT 1'
        );
        $stmt->execute(['id' => $id]);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        return $row ? Contact::fromArray($this->mapToClean($row, self::COLUMN_MAP)) : null;
    }

    #[\Override]
    public function save(Contact $contact): void
    {
        $data = $contact->toArray();
        $dbData = $this->mapToDolibarr($data, self::COLUMN_MAP);
        $dbData['statut'] = 1;
        $dbData['fk_user_creat'] = 1; // Default fallback for Dolibarr compatibility

        if ($contact->getId() === null) {
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

    #[\Override]
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
    #[\Override]
    public function findAll(
        array $filters = [],
        int $limit = 100,
        int $offset = 0,
        string $sortField = 't.rowid',
        string $sortOrder = 'ASC',
    ): array {
        $where = ['t.entity IN (0, 1)'];
        $params = [];

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

    #[\Override]
    public function findByEmail(string $email): ?Contact
    {
        $stmt = $this->pdo->prepare(
            'SELECT * FROM ' . $this->table . ' WHERE email = :email AND entity IN (0, 1) LIMIT 1'
        );
        $stmt->execute(['email' => $email]);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        return $row ? Contact::fromArray($this->mapToClean($row, self::COLUMN_MAP)) : null;
    }
}
