<?php

declare(strict_types=1);

namespace Plugin\Finance\Domain\Multicurrency;

interface MulticurrencyRepository
{
    public function save(Multicurrency $mc): int;
    public function findById(int $id): ?Multicurrency;
    public function findAll(): array;
    public function delete(int $id): bool;
}
