<?php

declare(strict_types=1);

namespace Plugin\Mrp\Domain\Workstation;

interface WorkstationRepository
{
    public function save(Workstation $workstation): int;
    public function findById(int $id): ?Workstation;
    public function findAll(int $limit = 500, int $offset = 0): array;
    public function delete(int $id): bool;
}
