<?php

declare(strict_types=1);

namespace App\Domain\Product;

/**
 * ProductType — Tipo de producto o servicio en Dolibarr (fk_product_type).
 */
enum ProductType: int
{
    case Product = 0;
    case Service = 1;

    public function label(): string
    {
        return match ($this) {
            self::Product => 'Producto',
            self::Service => 'Servicio',
        };
    }
}
