<?php

declare(strict_types=1);

namespace Core\Domain\Zapier;

interface ZapierRepository
{
    public function save(Zapier $zapier): int;
    public function findById(int $id): ?Zapier;
    public function findAll(): array;
    public function delete(int $id): bool;
}
