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

namespace Modules\CRM\Domain\ValueObject;

/**
 * Reference — Immutable value object for entity reference codes.
 *
 * Represents codes like customer code (CU2603-0001) or supplier code (SU2603-0001).
 */
final readonly class Reference
{
    public function __construct(
        private string $value
    ) {
        if ($value !== '' && !preg_match('/^[A-Za-z0-9\-\/]+$/', $value)) {
            throw new \InvalidArgumentException("Invalid reference format: {$value}");
        }
    }

    public function value(): string
    {
        return $this->value;
    }

    public function isEmpty(): bool
    {
        return $this->value === '';
    }

    public function __toString(): string
    {
        return $this->value;
    }

    public static function empty(): self
    {
        return new self('');
    }
}
