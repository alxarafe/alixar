<?php

declare(strict_types=1);

namespace App\Domain\Invoice;

/**
 * InvoiceType — Tipos de factura en Dolibarr.
 */
enum InvoiceType: int
{
    case Standard = 0;
    case Replacement = 1;
    case CreditNote = 2;
    case Deposit = 3;

    public function label(): string
    {
        return match ($this) {
            self::Standard => 'Estándar',
            self::Replacement => 'Sustitutiva',
            self::CreditNote => 'Abono',
            self::Deposit => 'Anticipo',
        };
    }
}
