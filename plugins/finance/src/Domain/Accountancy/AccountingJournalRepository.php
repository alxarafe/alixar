<?php

declare(strict_types=1);

namespace Plugin\Finance\Domain\Accountancy;

interface AccountingJournalRepository
{
    public function save(AccountingJournal $journal): int;
    public function findById(int $id): ?AccountingJournal;
    public function findByCode(string $code): ?AccountingJournal;
    public function findAll(): array;
    public function delete(int $id): bool;
}
