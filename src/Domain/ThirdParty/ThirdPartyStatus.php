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

namespace App\Domain\ThirdParty;

/**
 * ThirdPartyStatus — Workflow states for a ThirdParty.
 *
 * Dolibarr uses `status` field: 0 = Closed, 1 = Active.
 */
enum ThirdPartyStatus: int
{
    case Closed = 0;
    case Active = 1;

    public function label(): string
    {
        return match ($this) {
            self::Closed => 'Cerrado',
            self::Active => 'Activo',
        };
    }

    /**
     * @return ThirdPartyStatus[]
     */
    public function allowedTransitions(): array
    {
        return match ($this) {
            self::Closed => [self::Active],
            self::Active => [self::Closed],
        };
    }

    public function canTransitionTo(self $target): bool
    {
        return in_array($target, $this->allowedTransitions(), true);
    }
}
