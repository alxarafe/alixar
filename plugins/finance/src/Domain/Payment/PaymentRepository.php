<?php

declare(strict_types=1);

namespace Plugin\Finance\Domain\Payment;

/**
 * PaymentRepository — Interfaz del agregado Payment.
 */
interface PaymentRepository
{
    /**
     * @return array<Payment>
     */
    public function findAll(int $limit = 100, int $offset = 0, string $sortField = 'id', string $sortOrder = 'ASC'): array;

    /**
     * @param array<string, mixed> $criteria
     */
    public function count(array $criteria = []): int;

    public function findById(int $id): ?Payment;

    public function findByRef(string $ref): ?Payment;
    
    /**
     * @return array<Payment>
     */
    public function findByInvoiceId(int $invoiceId): array;

    public function save(Payment $payment): void;

    public function delete(int $id): void;
}
