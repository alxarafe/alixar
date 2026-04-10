<?php

declare(strict_types=1);

namespace App\Domain\Invoice;

/**
 * InvoiceStatus — Dolibarr invoice lifecycle.
 *
 *   DRAFT(0) → VALIDATED(1) → CLOSED/PAID(2)
 *                            → ABANDONED(3)
 */
enum InvoiceStatus: int
{
    case Draft = 0;
    case Validated = 1;
    case Closed = 2;      // = Paid
    case Abandoned = 3;

    public function label(): string
    {
        return match ($this) {
            self::Draft => 'Borrador',
            self::Validated => 'Validada',
            self::Closed => 'Pagada',
            self::Abandoned => 'Abandonada',
        };
    }

    /** @return InvoiceStatus[] */
    public function allowedTransitions(): array
    {
        return match ($this) {
            self::Draft => [self::Validated],
            self::Validated => [self::Closed, self::Abandoned, self::Draft],
            self::Closed => [self::Validated],  // reopen
            self::Abandoned => [self::Draft],
        };
    }

    public function canTransitionTo(self $target): bool
    {
        return in_array($target, $this->allowedTransitions(), true);
    }
}
