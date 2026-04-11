<?php

declare(strict_types=1);

namespace App\Domain\SupplierOrder;

/**
 * SupplierOrderRepository — Interfaz del agregado SupplierOrder.
 */
interface SupplierOrderRepository
{
    /**
     * @return array<SupplierOrder>
     */
    public function findAll(int $limit = 100, int $offset = 0, string $sortField = 'rowid', string $sortOrder = 'ASC'): array;

    /**
     * @param array<string, mixed> $criteria
     */
    public function count(array $criteria = []): int;

    public function findById(int $id): ?SupplierOrder;

    public function findByRef(string $ref): ?SupplierOrder;

    public function save(SupplierOrder $order): void;

    public function delete(int $id): void;

    // --- Lines (llx_commande_fournisseurdet) ---
    /** @return array<int, mixed> */
    public function getLines(int $orderId): array;
    /** @param array<string, mixed> $data */
    public function addLine(int $orderId, array $data): void;
    /** @param array<string, mixed> $data */
    public function updateLine(int $orderId, int $lineId, array $data): void;
    public function deleteLine(int $orderId, int $lineId): void;
}
