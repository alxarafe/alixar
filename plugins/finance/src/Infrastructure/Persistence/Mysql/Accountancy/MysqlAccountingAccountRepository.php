<?php

declare(strict_types=1);

namespace Plugin\Finance\Infrastructure\Persistence\Mysql\Accountancy;

use Plugin\Finance\Domain\Accountancy\AccountingAccount;
use Plugin\Finance\Domain\Accountancy\AccountingAccountRepository;
use PDO;

class MysqlAccountingAccountRepository implements AccountingAccountRepository
{
    public function __construct(private PDO $pdo)
    {
}

    public function save(AccountingAccount $account): int
    {
        if ($account->id) {
            $stmt = $this->pdo->prepare("
                UPDATE accounting_accounts 
                SET code = :code, label = :label, parent_id = :parent_id, type = :type, active = :active
                WHERE id = :id
            ");
        } else {
            $stmt = $this->pdo->prepare("
                INSERT INTO accounting_accounts (code, label, parent_id, type, active)
                VALUES (:code, :label, :parent_id, :type, :active)
            ");
        }

        $stmt->execute($account->toArray());
        return $account->id ?? (int) $this->pdo->lastInsertId();
    }

    public function findById(int $id): ?AccountingAccount
    {
        $stmt = $this->pdo->prepare("SELECT * FROM accounting_accounts WHERE id = :id");
        $stmt->execute(['id' => $id]);
        $data = $stmt->fetch();
        return $data ? AccountingAccount::fromArray($data) : null;
    }

    public function findByCode(string $code): ?AccountingAccount
    {
        $stmt = $this->pdo->prepare("SELECT * FROM accounting_accounts WHERE code = :code");
        $stmt->execute(['code' => $code]);
        $data = $stmt->fetch();
        return $data ? AccountingAccount::fromArray($data) : null;
    }

    public function findAll(int $limit = 500, int $offset = 0): array
    {
        $stmt = $this->pdo->prepare("SELECT * FROM accounting_accounts LIMIT :limit OFFSET :offset");
        $stmt->bindValue(':limit', $limit, PDO::PARAM_INT);
        $stmt->bindValue(':offset', $offset, PDO::PARAM_INT);
        $stmt->execute();
        
        $results = [];
        foreach ($stmt->fetchAll() as $data) {
            $results[] = AccountingAccount::fromArray($data);
        }
        return $results;
    }

    public function delete(int $id): bool
    {
        $stmt = $this->pdo->prepare("DELETE FROM accounting_accounts WHERE id = :id");
        return $stmt->execute(['id' => $id]);
    }
}
