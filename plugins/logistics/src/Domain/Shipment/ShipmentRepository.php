<?php

declare(strict_types=1);

namespace Plugin\Logistics\Domain\Shipment;

interface ShipmentRepository
{
    /**
     * @return array<Shipment>
     */
    public function findAll(int $limit = 100, int $offset = 0, string $sortField = 'id', string $sortOrder = 'ASC'): array;

    /**
     * @param array<string, mixed> $criteria
     */
    public function count(array $criteria = []): int;

    public function findById(int $id): ?Shipment;

    public function findByRef(string $ref): ?Shipment;

    public function save(Shipment $shipment): void;

    public function delete(int $id): void;
}
