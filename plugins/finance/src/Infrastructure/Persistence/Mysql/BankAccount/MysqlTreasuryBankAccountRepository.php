<?php

declare(strict_types=1);

namespace Plugin\Finance\Infrastructure\Persistence\Mysql\BankAccount;

use PDO;
use Plugin\Finance\Domain\BankAccount\BankAccount;
use Plugin\Finance\Domain\BankAccount\BankAccountRepository;

class MysqlTreasuryBankAccountRepository implements BankAccountRepository
{
    private string $table = 'treasury_bank_accounts';
    private string $transactionsTable = 'bank_transactions';

    public function __construct(private PDO $pdo)
    {
    }

    public function findAll(int $limit = 100, int $offset = 0, string $sortField = 'id', string $sortOrder = 'ASC'): array
    {
        $sortField = $sortField === 'rowid' ? 'id' : $sortField;
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

    public function findById(int $id): ?BankAccount
    {
        $stmt = $this->pdo->prepare("SELECT * FROM {$this->table} WHERE id = :id");
        $stmt->execute(['id' => $id]);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$row) {
            return null;
        }

        return $this->mapRowToEntity($row);
    }

    public function findByRef(string $ref): ?BankAccount
    {
        $stmt = $this->pdo->prepare("SELECT * FROM {$this->table} WHERE ref = :ref");
        $stmt->execute(['ref' => $ref]);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$row) {
            return null;
        }

        return $this->mapRowToEntity($row);
    }

    public function save(BankAccount $account): void
    {
        if ($account->getId() === null) {
            $this->insert($account);
        } else {
            $this->update($account);
        }
    }

    private function insert(BankAccount $account): void
    {
        $data = $account->toArray();
        $mappedData = $this->mapEntityToRow($data);
        unset($mappedData['id'], $mappedData['updated_at']);

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
        
        $account->setId((int) $this->pdo->lastInsertId());
    }

    private function update(BankAccount $account): void
    {
        $data = $account->toArray();
        $mappedData = $this->mapEntityToRow($data);
        $id = $mappedData['id'];
        unset($mappedData['id'], $mappedData['created_at']);

        $sets = array_map(fn($c) => "{$c} = :{$c}", array_keys($mappedData));

        $sql = sprintf(
            'UPDATE %s SET %s WHERE id = :id',
            $this->table,
            implode(', ', $sets)
        );

        $stmt = $this->pdo->prepare($sql);
        $stmt->execute(['id' => $id] + $mappedData);
    }

    public function delete(int $id): void
    {
        $stmt = $this->pdo->prepare("DELETE FROM {$this->table} WHERE id = :id");
        $stmt->execute(['id' => $id]);
    }

    // --- Transactions ---

    public function getTransactions(int $accountId): array
    {
        $stmt = $this->pdo->prepare("SELECT * FROM {$this->transactionsTable} WHERE account_id = :id");
        $stmt->execute(['id' => $accountId]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];
    }

    public function addTransaction(int $accountId, array $data): void
    {
        $data['account_id'] = $accountId;
        $columns = array_keys($data);
        $placeholders = array_map(fn($c) => ':' . $c, $columns);
        $sql = sprintf('INSERT INTO %s (%s) VALUES (%s)', $this->transactionsTable, implode(', ', $columns), implode(', ', $placeholders));
        $this->pdo->prepare($sql)->execute($data);
    }

    public function updateTransaction(int $accountId, int $transactionId, array $data): void
    {
        $sets = array_map(fn($c) => "{$c} = :{$c}", array_keys($data));
        $sql = sprintf('UPDATE %s SET %s WHERE id = :id AND account_id = :pid', $this->transactionsTable, implode(', ', $sets));
        $data['id'] = $transactionId;
        $data['pid'] = $accountId;
        $this->pdo->prepare($sql)->execute($data);
    }

    public function deleteTransaction(int $accountId, int $transactionId): void
    {
        $stmt = $this->pdo->prepare("DELETE FROM {$this->transactionsTable} WHERE id = :id AND account_id = :pid");
        $stmt->execute(['id' => $transactionId, 'pid' => $accountId]);
    }

    // --- Mappers ---

    private function mapRowToEntity(array $row): BankAccount
    {
        return BankAccount::fromArray([
            'id' => (int) $row['id'],
            'ref' => $row['ref'],
            'label' => $row['label'],
            'bank' => $row['bank'],
            'bic' => $row['bic'],
            'ibanPrefix' => $row['iban_prefix'],
            'currencyCode' => $row['currency_code'],
            'status' => (int) $row['status'],
            'accountType' => (int) $row['account_type'],
            'createdAt' => $row['created_at'],
            'updatedAt' => $row['updated_at']
        ]);
    }

    private function mapEntityToRow(array $data): array
    {
        return [
            'id' => $data['id'] !== null ? (int) $data['id'] : null,
            'ref' => $data['ref'],
            'label' => $data['label'],
            'bank' => $data['bank'],
            'bic' => $data['bic'],
            'iban_prefix' => $data['ibanPrefix'],
            'currency_code' => $data['currencyCode'],
            'status' => $data['status'],
            'account_type' => $data['accountType'],
            'created_at' => $data['createdAt'],
            'updated_at' => $data['updatedAt']
        ];
    }
}
