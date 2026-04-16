<?php

declare(strict_types=1);

namespace Plugin\Finance\Domain\Accountancy;

interface AccountingAccountRepository
{
    public function save(AccountingAccount $account): int;
    public function findById(int $id): ?AccountingAccount;
    public function findByCode(string $code): ?AccountingAccount;
    public function findAll(int $limit = 500, int $offset = 0): array;
    public function delete(int $id): bool;
}
