<?php

declare(strict_types=1);

namespace Plugin\Business\Infrastructure\Persistence\Mysql\BankAccount;

use Plugin\Business\Domain\BankAccount\BankAccount;
use Plugin\Business\Domain\BankAccount\BankAccountRepository;
use PDO;

class MysqlBankAccountRepository implements BankAccountRepository
{
    private string $table;

    public function __construct(private PDO $pdo)
    {
        $this->table = 'bank_accounts';
    }

    #[\Override]
    public function findById(int $id): ?BankAccount
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
    public function findByThirdPartyId(int $thirdPartyId): array
    {
        $stmt = $this->pdo->prepare('SELECT * FROM ' . $this->table . ' WHERE third_party_id = :id');
        $stmt->execute(['id' => $thirdPartyId]);
        $rows = $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];

        $items = [];
        foreach ($rows as $row) {
            $items[] = $this->mapRowToEntity($row);
        }

        return $items;
    }

    #[\Override]
    public function save(BankAccount $account): void
    {
        if ($account->getId() === null) {
            $this->insert($account);
        } else {
            $this->update($account);
        }
    }

    private function insert(BankAccount $entity): void
    {
        $data = $entity->toArray();
        unset($data['id']);

        $columns = array_keys($data);
        $placeholders = array_map(fn($c) => ':' . $c, $columns);
        // Replace camelCase keys with snake_case
        $mappedData = [];
        foreach ($data as $k => $v) {
            $snake = strtolower(preg_replace('/(?<!^)[A-Z]/', '_$0', $k));
            $mappedData[$snake] = $v;
        }

        $columns = array_keys($mappedData);
        $placeholders = array_map(fn($c) => ':' . $c, $columns);

        $sql = sprintf(
            'INSERT INTO %s (%s) VALUES (%s)',
            $this->table,
            implode(', ', $columns),
            implode(', ', $placeholders)
        );

        $stmt = $this->pdo->prepare($sql);
        $stmt->execute($mappedData);
        $entity->setId((int) $this->pdo->lastInsertId());
    }

    private function update(BankAccount $entity): void
    {
        $data = $entity->toArray();
        $id = $data['id'];
        unset($data['id']);

        $mappedData = [];
        foreach ($data as $k => $v) {
            $snake = strtolower(preg_replace('/(?<!^)[A-Z]/', '_$0', $k));
            $mappedData[$snake] = $v;
        }

        $sets = array_map(fn($c) => "{$c} = :{$c}", array_keys($mappedData));

        $sql = sprintf(
            'UPDATE %s SET %s WHERE id = :id',
            $this->table,
            implode(', ', $sets)
        );

        $stmt = $this->pdo->prepare($sql);
        $stmt->execute(['id' => $id] + $mappedData);
    }

    #[\Override]
    public function delete(int $id): void
    {
        $stmt = $this->pdo->prepare('DELETE FROM ' . $this->table . ' WHERE id = :id');
        $stmt->execute(['id' => $id]);
    }

    private function mapRowToEntity(array $row): BankAccount
    {
        return new BankAccount(
            thirdPartyId: (int) $row['third_party_id'],
            bank: $row['bank'],
            bankCode: $row['bank_code'],
            deskCode: $row['desk_code'],
            number: $row['number'],
            ribKey: $row['rib_key'],
            bic: $row['bic'],
            iban: $row['iban'],
            ownerName: $row['owner_name'],
            ownerAddress: $row['owner_address'],
            label: $row['label'],
            isDefault: (bool) $row['is_default'],
            id: (int) $row['id']
        );
    }
}
