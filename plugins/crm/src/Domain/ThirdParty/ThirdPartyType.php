<?php

declare(strict_types=1);

/*
 * Copyright (C) 2024-2026 Rafael San José <rsanjose@alxarafe.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 */

namespace Plugin\Crm\Domain\ThirdParty;

/**
 * ThirdPartyType — Decodes the Dolibarr `client` field.
 *
 * Dolibarr encodes customer/prospect status in a single integer:
 *   0 = Neither customer nor prospect
 *   1 = Customer
 *   2 = Prospect
 *   3 = Customer and Prospect
 */
enum ThirdPartyType: int
{
    case None = 0;
    case Customer = 1;
    case Prospect = 2;
    case CustomerAndProspect = 3;

    public function isCustomer(): bool
    {
        return $this === self::Customer || $this === self::CustomerAndProspect;
    }

    public function isProspect(): bool
    {
        return $this === self::Prospect || $this === self::CustomerAndProspect;
    }

    public function label(): string
    {
        return match ($this) {
            self::None => 'Ninguno',
            self::Customer => 'Cliente',
            self::Prospect => 'Prospecto',
            self::CustomerAndProspect => 'Cliente y Prospecto',
        };
    }
}
