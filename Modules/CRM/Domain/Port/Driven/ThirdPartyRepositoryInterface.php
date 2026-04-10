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

namespace Modules\CRM\Domain\Port\Driven;

use Modules\CRM\Domain\Model\ThirdParty;

/**
 * ThirdPartyRepositoryInterface — Driven port for ThirdParty persistence.
 *
 * Follows the same pattern as Chascarrillo's PostRepositoryInterface.
 */
interface ThirdPartyRepositoryInterface
{
    public function findById(int $id): ?ThirdParty;

    public function findByCustomerCode(string $code): ?ThirdParty;

    public function findBySupplierCode(string $code): ?ThirdParty;

    public function save(ThirdParty $thirdParty): void;

    public function delete(int $id): void;

    /**
     * @param array<string, mixed> $filters
     * @return ThirdParty[]
     */
    public function findAll(array $filters = [], int $limit = 50, int $offset = 0): array;

    /**
     * @param array<string, mixed> $criteria
     */
    public function count(array $criteria = []): int;

    /**
     * Get the last sequential number used for a reference mask on a given field.
     * Used by ReferenceGenerator to produce the next code.
     */
    public function getLastReferenceNumber(string $field, string $prefix): int;
}
