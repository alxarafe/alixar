<?php

declare(strict_types=1);

namespace App\Domain\BankAccount;

/**
 * BankAccountRepository — Interfaz del agregado BankAccount.
 */
interface BankAccountRepository
{
    /**
     * @return array<BankAccount>
     */
    public function findAll(int $limit = 100, int $offset = 0, string $sortField = 'rowid', string $sortOrder = 'ASC'): array;

    /**
     * @param array<string, mixed> $criteria
     */
    public function count(array $criteria = []): int;

    public function findById(int $id): ?BankAccount;

    public function findByRef(string $ref): ?BankAccount;

    public function save(BankAccount $account): void;

    public function delete(int $id): void;

    // --- Transactions (llx_bank) ---
    /** @return array<int, mixed> */
    public function getTransactions(int $accountId): array;
    /** @param array<string, mixed> $data */
    public function addTransaction(int $accountId, array $data): void;
    /** @param array<string, mixed> $data */
    public function updateTransaction(int $accountId, int $transactionId, array $data): void;
    public function deleteTransaction(int $accountId, int $transactionId): void;
}
