<?php

declare(strict_types=1);

namespace Plugin\Products\Domain\Lot;

interface ProductLotRepository
{
    public function save(ProductLot $lot): int;
    public function findById(int $id): ?ProductLot;
    public function findByBatchNumber(string $batchNumber): ?ProductLot;
    public function findByProduct(int $productId): array;
    public function delete(int $id): bool;
}
