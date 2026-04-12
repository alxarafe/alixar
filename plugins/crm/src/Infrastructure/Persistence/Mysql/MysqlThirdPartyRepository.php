<?php

declare(strict_types=1);

namespace Plugin\Crm\Infrastructure\Persistence\Mysql;

use Plugin\Crm\Domain\ThirdParty\ThirdParty;
use Plugin\Crm\Domain\ThirdParty\ThirdPartyRepository;
use PDO;

/**
 * MysqlThirdPartyRepository — PDO adapter for the Dolibarr `societe` table.
 *
 * Pure PDO, no framework, no Eloquent, no Alxarafe dependency.
 */
class MysqlThirdPartyRepository implements ThirdPartyRepository
{
    use \Core\Infrastructure\DolibarrMappingTrait;

    private const COLUMN_MAP = [
        'id' => 'rowid',
        'name' => 'nom',
        'nameAlias' => 'name_alias',
        'type' => 'client',
        'isSupplier' => 'fournisseur',
        'customerCode' => 'code_client',
        'supplierCode' => 'code_fournisseur',
        'address' => 'address',
        'zip' => 'zip',
        'town' => 'town',
        'countryId' => 'fk_pays',
        'phone' => 'phone',
        'email' => 'email',
        'url' => 'url',
        'vatNumber' => 'tva_intra',
        'nif' => 'siren',
        'notePrivate' => 'note_private',
        'notePublic' => 'note_public',
        'createdAt' => 'datec',
    ];
    private string $table;

    public function __construct(
        private PDO $pdo,
        string $tablePrefix = '',
    ) {
        $this->table = $tablePrefix . 'societe';
    }

    #[\Override]
    public function findById(int $id): ?ThirdParty
    {
        $stmt = $this->pdo->prepare(
            'SELECT * FROM ' . $this->table . ' WHERE rowid = :id LIMIT 1'
        );
        $stmt->execute(['id' => $id]);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        return $row ? ThirdParty::fromArray($this->mapToClean($row, self::COLUMN_MAP)) : null;
    }

    #[\Override]
    public function save(ThirdParty $thirdParty): void
    {
        $data = $thirdParty->toArray();
        // Translate clean domain format into Dolibarr DB columns BEFORE generating SQL
        $dbData = $this->mapToDolibarr($data, self::COLUMN_MAP);

        if ($thirdParty->getId() === null) {
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
            $thirdParty->setId((int) $this->pdo->lastInsertId());
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

    #[\Override]
    public function delete(int $id): void
    {
        $stmt = $this->pdo->prepare(
            'DELETE FROM ' . $this->table . ' WHERE rowid = :id'
        );
        $stmt->execute(['id' => $id]);
    }

    /**
     * @param array<string, mixed> $filters
     * @return ThirdParty[]
     */
    #[\Override]
    public function findAll(
        array $filters = [],
        int $limit = 100,
        int $offset = 0,
        string $sortField = 't.rowid',
        string $sortOrder = 'ASC',
    ): array {
        $where = ['1=1'];
        $params = [];

        // Dolibarr mode filter
        if (isset($filters['mode'])) {
            $mode = (int) $filters['mode'];
            match ($mode) {
                1 => $where[] = 't.client IN (1, 3)',      // Customers
                2 => $where[] = 't.client IN (2, 3)',      // Prospects
                3 => $where[] = 't.client IN (0)',         // Neither
                4 => $where[] = 't.fournisseur IN (1)',    // Suppliers
                default => null,
            };
        }

        // Sanitize sort to prevent injection
        $allowedSort = ['t.rowid', 't.nom', 't.datec', 't.town', 't.status'];
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

        return array_map(fn(array $row) => ThirdParty::fromArray($this->mapToClean($row, self::COLUMN_MAP)), $rows);
    }

    /**
     * @param array<string, mixed> $criteria
     */
    #[\Override]
    public function count(array $criteria = []): int
    {
        $stmt = $this->pdo->query('SELECT COUNT(*) FROM ' . $this->table);
        return (int) $stmt->fetchColumn();
    }

    #[\Override]
    public function findByEmail(string $email): ?ThirdParty
    {
        $stmt = $this->pdo->prepare('SELECT * FROM ' . $this->table . ' WHERE email = :email LIMIT 1');
        $stmt->execute(['email' => $email]);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        return $row ? ThirdParty::fromArray($this->mapToClean($row, self::COLUMN_MAP)) : null;
    }

    #[\Override]
    public function findByVatNumber(string $vatNumber): ?ThirdParty
    {
        $stmt = $this->pdo->prepare('SELECT * FROM ' . $this->table . ' WHERE tva_intra = :vat LIMIT 1');
        $stmt->execute(['vat' => $vatNumber]);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        return $row ? ThirdParty::fromArray($this->mapToClean($row, self::COLUMN_MAP)) : null;
    }
}
