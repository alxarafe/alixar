<?php

declare(strict_types=1);

namespace App\Domain\SupplierInvoice;

/**
 * SupplierInvoiceRepository — Interfaz del agregado SupplierInvoice.
 */
interface SupplierInvoiceRepository
{
    /**
     * @return array<SupplierInvoice>
     */
    public function findAll(int $limit = 100, int $offset = 0, string $sortField = 'rowid', string $sortOrder = 'ASC'): array;

    /**
     * @param array<string, mixed> $criteria
     */
    public function count(array $criteria = []): int;

    public function findById(int $id): ?SupplierInvoice;

    public function findByRef(string $ref): ?SupplierInvoice;

    public function save(SupplierInvoice $invoice): void;

    public function delete(int $id): void;

    // --- Lines (llx_facture_fourn_det) ---
    /** @return array<int, mixed> */
    public function getLines(int $invoiceId): array;
    /** @param array<string, mixed> $data */
    public function addLine(int $invoiceId, array $data): void;
    /** @param array<string, mixed> $data */
    public function updateLine(int $invoiceId, int $lineId, array $data): void;
    public function deleteLine(int $invoiceId, int $lineId): void;

    // --- Payments ---
    /** @return array<int, mixed> */
    public function getPayments(int $invoiceId): array;
    /** @param array<string, mixed> $data */
    public function addPayment(int $invoiceId, array $data): void;
}
