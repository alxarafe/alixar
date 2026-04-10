<?php

declare(strict_types=1);

namespace App\Domain\Invoice;

class InvoiceNotFoundException extends \RuntimeException
{
    public static function withId(int $id): self
    {
        return new self("Factura con ID {$id} no encontrada.", 404);
    }
}
