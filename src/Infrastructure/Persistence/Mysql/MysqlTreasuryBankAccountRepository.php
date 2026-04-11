<?php

declare(strict_types=1);

namespace App\Infrastructure\Persistence\Mysql;

use App\Domain\BankAccount\BankAccount;
use App\Domain\BankAccount\BankAccountRepository;
use App\Infrastructure\DolibarrMappingTrait;
use PDO;

class MysqlTreasuryBankAccountRepository implements BankAccountRepository
{
    use DolibarrMappingTrait;

    private string $table;

    // Dolibarr's 'llx_bank_account'
    private const COLUMN_MAP = [
        'id' => 'rowid',
        'ref' => 'ref',
        'label' => 'label',
        'bank' => 'bank',
        'bic' => 'bic',
        'ibanPrefix' => 'iban_prefix',
        'currencyCode' => 'currency_code',
        'status' => 'clos',
        'accountType' => 'courant',
        'createdAt' => 'datec',
        'updatedAt' => 'tms',
    ];

    public function __construct(private PDO $pdo, string $prefix = 'llx_')
    {
        $this->table = $prefix . 'bank_account';
    }

    /**
     * @return array<BankAccount>
     */
    public function findAll(int $limit = 100, int $offset = 0, string $sortField = 'rowid', string $sortOrder = 'ASC'): array
    {
        $allowedSortFields = array_values(self::COLUMN_MAP);
        if (!in_array($sortField, $allowedSortFields, true)) {
            $sortField = 'rowid';
        }

        $sortOrder = strtoupper($sortOrder) === 'DESC' ? 'DESC' : 'ASC';

        $sql = sprintf('SELECT * FROM %s ORDER BY %s %s LIMIT %d OFFSET %d', $this->table, $sortField, $sortOrder, $limit, $offset);
        $stmt = $this->pdo->query($sql);
        
        if (!$stmt) return [];
        $rows = $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];

        $accounts = [];
        foreach ($rows as $row) {
            $accounts[] = BankAccount::fromArray($this->mapToClean($row, self::COLUMN_MAP));
        }

        return $accounts;
    }

    /**
     * @param array<string, mixed> $criteria
     */
    public function count(array $criteria = []): int
    {
        $stmt = $this->pdo->query('SELECT COUNT(*) FROM ' . $this->table);
        if (!$stmt) return 0;
        return (int) $stmt->fetchColumn();
    }

    public function findById(int $id): ?BankAccount
    {
        $stmt = $this->pdo->prepare('SELECT * FROM ' . $this->table . ' WHERE rowid = :id');
        $stmt->execute(['id' => $id]);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$row) return null;

        return BankAccount::fromArray($this->mapToClean($row, self::COLUMN_MAP));
    }

    public function findByRef(string $ref): ?BankAccount
    {
        $stmt = $this->pdo->prepare('SELECT * FROM ' . $this->table . ' WHERE ref = :ref');
        $stmt->execute(['ref' => $ref]);
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$row) return null;

        return BankAccount::fromArray($this->mapToClean($row, self::COLUMN_MAP));
    }

    public function save(BankAccount $account): void
    {
        $dbData = $this->mapToDolibarr($account->toArray(), self::COLUMN_MAP);
        unset($dbData['tms']);

        if ($account->getId() === null) {
            unset($dbData['rowid']);
            $dbData['entity'] = 1;
            
            // Bypass strict schema requirements if missing
            if (!isset($dbData['currency_code']) || empty($dbData['currency_code'])) {
                $dbData['currency_code'] = 'EUR';
            }
            if (!isset($dbData['fk_pays'])) {
                $dbData['fk_pays'] = 0; // Dolibarr schema requires NOT NULL
            }

            $columns = array_keys($dbData);
            $placeholders = array_map(fn($c) => ':' . $c, $columns);

            $sql = sprintf('INSERT INTO %s (%s) VALUES (%s)', $this->table, implode(', ', $columns), implode(', ', $placeholders));
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute($dbData);
            
            $account->setId((int) $this->pdo->lastInsertId());
        } else {
            $id = $dbData['rowid'];
            unset($dbData['rowid']);
            unset($dbData['datec']);

            $sets = array_map(fn($c) => "{$c} = :{$c}", array_keys($dbData));

            $sql = sprintf('UPDATE %s SET %s WHERE rowid = :id', $this->table, implode(', ', $sets));
            $stmt = $this->pdo->prepare($sql);
            $stmt->execute(['id' => $id] + $dbData);
        }
    }

    public function delete(int $id): void
    {
        $stmt = $this->pdo->prepare('DELETE FROM ' . $this->table . ' WHERE rowid = :id');
        $stmt->execute(['id' => $id]);
    }

    // --- Transactions (llx_bank) ---
    public function getTransactions(int $accountId): array
    {
        $prefix = str_replace('bank_account', 'bank', $this->table); // Get llx_bank
        $stmt = $this->pdo->prepare("SELECT * FROM {$prefix} WHERE fk_account = :id");
        $stmt->execute(['id' => $accountId]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC) ?: [];
    }

    public function addTransaction(int $accountId, array $data): void
    {
        $prefix = str_replace('bank_account', 'bank', $this->table); // Get llx_bank
        
        $data['fk_account'] = $accountId;
        if (!isset($data['amount'])) $data['amount'] = 0.0;
        
        $columns = array_keys($data);
        $placeholders = array_map(fn($c) => ':' . $c, $columns);
        $sql = sprintf("INSERT INTO {$prefix} (%s) VALUES (%s)", implode(', ', $columns), implode(', ', $placeholders));
        
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute($data);
    }

    public function updateTransaction(int $accountId, int $transactionId, array $data): void
    {
        $prefix = str_replace('bank_account', 'bank', $this->table); // Get llx_bank
        
        unset($data['rowid']);
        unset($data['fk_account']);

        $sets = array_map(fn($c) => "{$c} = :{$c}", array_keys($data));
        $sql = sprintf("UPDATE {$prefix} SET %s WHERE rowid = :transactionId AND fk_account = :accountId", implode(', ', $sets));
        
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute(['transactionId' => $transactionId, 'accountId' => $accountId] + $data);
    }

    public function deleteTransaction(int $accountId, int $transactionId): void
    {
        $prefix = str_replace('bank_account', 'bank', $this->table); // Get llx_bank
        $stmt = $this->pdo->prepare("DELETE FROM {$prefix} WHERE rowid = :transactionId AND fk_account = :accountId");
        $stmt->execute(['transactionId' => $transactionId, 'accountId' => $accountId]);
    }
}
