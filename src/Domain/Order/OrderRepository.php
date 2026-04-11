<?php

declare(strict_types=1);

namespace App\Domain\Order;

/**
 * OrderRepository — Interfaz del agregado Order.
 */
interface OrderRepository
{
    /**
     * @return array<Order>
     */
    public function findAll(int $limit = 100, int $offset = 0, string $sortField = 'rowid', string $sortOrder = 'ASC'): array;

    /**
     * @param array<string, mixed> $criteria
     */
    public function count(array $criteria = []): int;

    public function findById(int $id): ?Order;

    public function findByRef(string $ref): ?Order;

    public function save(Order $order): void;

    public function delete(int $id): void;

    // --- Lines (commandedet) ---
    /** @return array<int, mixed> */
    public function getLines(int $orderId): array;
    /** @param array<string, mixed> $data */
    public function addLine(int $orderId, array $data): void;
    /** @param array<string, mixed> $data */
    public function updateLine(int $orderId, int $lineId, array $data): void;
    public function deleteLine(int $orderId, int $lineId): void;

    // --- Contacts ---
    /** @return array<int, mixed> */
    public function getContacts(int $orderId, string $type = ''): array;
    public function addContact(int $orderId, int $contactId, string $type): void;
    public function deleteContact(int $orderId, int $contactId, string $type): void;
}
