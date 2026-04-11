<?php

declare(strict_types=1);

namespace App\Domain\Invoice;

interface InvoiceRepository
{
    public function findById(int $id): ?Invoice;
    public function findByRef(string $ref): ?Invoice;
    public function findByRefExt(string $refExt): ?Invoice;

    public function save(Invoice $invoice): void;

    public function delete(int $id): void;

    /**
     * @param array<string, mixed> $filters
     * @return Invoice[]
     */
    public function findAll(
        array $filters = [],
        int $limit = 100,
        int $offset = 0,
        string $sortField = 't.rowid',
        string $sortOrder = 'ASC',
    ): array;

    // ── Lines ────────────────────────────────────────────

    /** @return InvoiceLine[] */
    public function findLinesByInvoiceId(int $invoiceId): array;

    public function findLineById(int $id): ?InvoiceLine;

    public function saveLine(InvoiceLine $line): void;

    public function deleteLine(int $lineId): void;

    /**
     * Recalculate and update header totals from lines.
     */
    public function updateTotals(int $invoiceId): void;
}
