<?php

declare(strict_types=1);

namespace Plugin\Hr\Domain\Salary;

interface SalaryRepository
{
    public function save(Salary $salary): int;
    public function findById(int $id): ?Salary;
    public function findAll(int $limit = 500, int $offset = 0): array;
    public function delete(int $id): bool;
}
