<?php

declare(strict_types=1);

namespace Plugin\Logistics\Domain\StockMovement;

interface StockMovementRepository
{
    /**
     * @return array<StockMovement>
     */
    public function findAll(int $limit = 100, int $offset = 0, string $sortField = 'id', string $sortOrder = 'ASC'): array;

    public function findById(int $id): ?StockMovement;

    /**
     * @return array<StockMovement>
     */
    public function findByProduct(int $productId): array;

    /**
     * @return array<StockMovement>
     */
    public function findByWarehouse(int $warehouseId): array;

    public function save(StockMovement $movement): void;

    public function delete(int $id): void;
}
