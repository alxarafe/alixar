<?php

declare(strict_types=1);

namespace Plugin\Logistics\Domain\Warehouse;

interface WarehouseRepository
{
    /**
     * @return array<Warehouse>
     */
    public function findAll(int $limit = 100, int $offset = 0, string $sortField = 'id', string $sortOrder = 'ASC'): array;

    /**
     * @param array<string, mixed> $criteria
     */
    public function count(array $criteria = []): int;

    public function findById(int $id): ?Warehouse;

    public function findByRef(string $ref): ?Warehouse;

    public function save(Warehouse $warehouse): void;

    public function delete(int $id): void;
}
