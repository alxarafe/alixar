<?php

declare(strict_types=1);

namespace Plugin\Finance\Infrastructure\Persistence\Mysql\Accountancy;

use Plugin\Finance\Domain\Accountancy\AccountingJournal;
use Plugin\Finance\Domain\Accountancy\AccountingJournalRepository;
use PDO;

class MysqlAccountingJournalRepository implements AccountingJournalRepository
{
    public function __construct(private PDO $pdo)
    {
}

    public function save(AccountingJournal $journal): int
    {
        if ($journal->id) {
            $stmt = $this->pdo->prepare("
                UPDATE accounting_journals 
                SET code = :code, label = :label, type = :type, active = :active
                WHERE id = :id
            ");
        } else {
            $stmt = $this->pdo->prepare("
                INSERT INTO accounting_journals (code, label, type, active)
                VALUES (:code, :label, :type, :active)
            ");
        }

        $stmt->execute($journal->toArray());
        return $journal->id ?? (int) $this->pdo->lastInsertId();
    }

    public function findById(int $id): ?AccountingJournal
    {
        $stmt = $this->pdo->prepare("SELECT * FROM accounting_journals WHERE id = :id");
        $stmt->execute(['id' => $id]);
        $data = $stmt->fetch();
        return $data ? AccountingJournal::fromArray($data) : null;
    }

    public function findByCode(string $code): ?AccountingJournal
    {
        $stmt = $this->pdo->prepare("SELECT * FROM accounting_journals WHERE code = :code");
        $stmt->execute(['code' => $code]);
        $data = $stmt->fetch();
        return $data ? AccountingJournal::fromArray($data) : null;
    }

    public function findAll(): array
    {
        $stmt = $this->pdo->query("SELECT * FROM accounting_journals ORDER BY code ASC");
        $results = [];
        foreach ($stmt->fetchAll() as $data) {
            $results[] = AccountingJournal::fromArray($data);
        }
        return $results;
    }

    public function delete(int $id): bool
    {
        $stmt = $this->pdo->prepare("DELETE FROM accounting_journals WHERE id = :id");
        return $stmt->execute(['id' => $id]);
    }
}
