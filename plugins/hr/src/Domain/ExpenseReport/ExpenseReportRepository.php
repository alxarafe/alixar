<?php

declare(strict_types=1);

namespace Plugin\Hr\Domain\ExpenseReport;

interface ExpenseReportRepository
{
    /**
     * @return array<ExpenseReport>
     */
    public function findAll(int $limit = 100, int $offset = 0, string $sortField = 'id', string $sortOrder = 'ASC'): array;

    /**
     * @param array<string, mixed> $criteria
     */
    public function count(array $criteria = []): int;

    public function findById(int $id): ?ExpenseReport;

    public function findByRef(string $ref): ?ExpenseReport;

    public function save(ExpenseReport $expenseReport): void;

    public function delete(int $id): void;
}
