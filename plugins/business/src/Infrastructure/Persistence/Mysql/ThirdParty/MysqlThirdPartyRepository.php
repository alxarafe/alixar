<?php

declare(strict_types=1);

namespace Plugin\Business\Infrastructure\Persistence\Mysql\ThirdParty;

use Plugin\Business\Domain\ThirdParty\ThirdParty;
use Plugin\Business\Domain\ThirdParty\ThirdPartyRepository;
use PDO;

class MysqlThirdPartyRepository implements ThirdPartyRepository
{
    private string $table;

    public function __construct(private PDO $pdo)
    {
        $this->table = 'third_parties';
    }

    #[\Override]
    public function findById(int $id): ?ThirdParty
    {
        $stmt = $this->pdo->prepare('SELECT * FROM ' . $this->table . ' WHERE id = :id');
        $stmt->execute(['id' => $id]);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$row) {
            return null;
        }

        return $this->mapRowToEntity($row);
    }

    #[\Override]
    public function findByEmail(string $email): ?ThirdParty
    {
        $stmt = $this->pdo->prepare('SELECT * FROM ' . $this->table . ' WHERE email = :email LIMIT 1');
        $stmt->execute(['email' => $email]);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$row) {
            return null;
        }

        return $this->mapRowToEntity($row);
    }

    #[\Override]
    public function findByVatNumber(string $vatNumber): ?ThirdParty
    {
        $stmt = $this->pdo->prepare('SELECT * FROM ' . $this->table . ' WHERE vat_number = :vat LIMIT 1');
        $stmt->execute(['vat' => $vatNumber]);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$row) {
            return null;
        }

        return $this->mapRowToEntity($row);
    }

    #[\Override]
    public function findAll(
        array $filters = [],
        int $limit = 100,
        int $offset = 0,
        string $sortField = 'id',
        string $sortOrder = 'ASC'
    ): array {
        // Fallback for requests using dolibarr legacy fields or prefixes
        if ($sortField === 't.rowid' || $sortField === 'rowid') {
            $sortField = 'id';
        }
        $sortOrder = strtoupper($sortOrder) === 'DESC' ? 'DESC' : 'ASC';

        $sql = sprintf(
            'SELECT * FROM %s ORDER BY %s %s LIMIT %d OFFSET %d',
            $this->table,
            $sortField,
            $sortOrder,
            $limit,
            $offset
        );

        $stmt = $this->pdo->query($sql);
        if (!$stmt) {
            return [];
        }
        $rows = $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];

        $items = [];
        foreach ($rows as $row) {
            $items[] = $this->mapRowToEntity($row);
        }

        return $items;
    }

    #[\Override]
    public function count(array $criteria = []): int
    {
        $stmt = $this->pdo->query('SELECT COUNT(*) FROM ' . $this->table);
        if (!$stmt) {
            return 0;
        }
        return (int) $stmt->fetchColumn();
    }

    #[\Override]
    public function save(ThirdParty $thirdParty): void
    {
        if ($thirdParty->getId() === null) {
            $this->insert($thirdParty);
        } else {
            $this->update($thirdParty);
        }
    }

    private function insert(ThirdParty $entity): void
    {
        $data = $this->extractParams($entity);
        unset($data['id']);

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
        $entity->setId((int) $this->pdo->lastInsertId());
    }

    private function update(ThirdParty $entity): void
    {
        $data = $this->extractParams($entity);
        $id = $data['id'];
        unset($data['id']);
        unset($data['created_at']);

        $sets = array_map(fn($c) => "{$c} = :{$c}", array_keys($data));

        $sql = sprintf(
            'UPDATE %s SET %s WHERE id = :id',
            $this->table,
            implode(', ', $sets)
        );

        $stmt = $this->pdo->prepare($sql);
        $stmt->execute(['id' => $id] + $data);
    }

    #[\Override]
    public function delete(int $id): void
    {
        $stmt = $this->pdo->prepare('DELETE FROM ' . $this->table . ' WHERE id = :id');
        $stmt->execute(['id' => $id]);
    }

    private function mapRowToEntity(array $row): ThirdParty
    {
        return ThirdParty::fromArray([
            'id' => (int) $row['id'],
            'name' => $row['name'],
            'nameAlias' => $row['name_alias'] ?? null,
            'type' => (int) $row['type'],
            'isSupplier' => (bool) $row['is_supplier'],
            'status' => (int) $row['status'],
            'address' => $row['address'] ?? null,
            'zip' => $row['zip'] ?? null,
            'town' => $row['town'] ?? null,
            'countryId' => isset($row['country_id']) ? (int) $row['country_id'] : null,
            'phone' => $row['phone'] ?? null,
            'email' => $row['email'] ?? null,
            'url' => $row['url'] ?? null,
            'vatNumber' => $row['vat_number'] ?? null,
            'nif' => $row['nif'] ?? null,
            'capital' => isset($row['capital']) ? (float) $row['capital'] : null,
            'customerCode' => $row['customer_code'] ?? null,
            'supplierCode' => $row['supplier_code'] ?? null,
            'notePrivate' => $row['note_private'] ?? null,
            'notePublic' => $row['note_public'] ?? null,
            'entity' => (int) $row['entity'],
            'createdAt' => $row['created_at'],
        ]);
    }

    private function extractParams(ThirdParty $entity): array
    {
        $arr = $entity->toArray();
        return [
            'id' => $arr['id'],
            'name' => $arr['name'],
            'name_alias' => $arr['nameAlias'],
            'type' => $arr['type'],
            'is_supplier' => $arr['isSupplier'],
            'status' => $arr['status'],
            'address' => $arr['address'],
            'zip' => $arr['zip'],
            'town' => $arr['town'],
            'country_id' => $arr['countryId'],
            'phone' => $arr['phone'],
            'email' => $arr['email'],
            'url' => $arr['url'],
            'vat_number' => $arr['vatNumber'],
            'nif' => $arr['nif'],
            'capital' => $arr['capital'],
            'customer_code' => $arr['customerCode'],
            'supplier_code' => $arr['supplierCode'],
            'note_private' => $arr['notePrivate'],
            'note_public' => $arr['notePublic'],
            'entity' => $arr['entity'],
            'created_at' => $arr['createdAt'],
        ];
    }
}
