<?php

declare(strict_types=1);

namespace Plugin\Mrp\Domain\ManufacturingOrder;

interface ManufacturingOrderRepository
{
    public function save(ManufacturingOrder $mo): int;
    public function findById(int $id): ?ManufacturingOrder;
    public function findAll(int $limit = 500, int $offset = 0): array;
    public function delete(int $id): bool;
}
