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

use Modules\CRM\Domain\Model\Contact;

/**
 * ContactRepositoryInterface — Driven port for Contact persistence.
 */
interface ContactRepositoryInterface
{
    public function findById(int $id): ?Contact;

    /**
     * @return Contact[]
     */
    public function findByThirdPartyId(int $thirdPartyId): array;

    public function save(Contact $contact): void;

    public function delete(int $id): void;

    /**
     * @param array<string, mixed> $filters
     * @return Contact[]
     */
    public function findAll(array $filters = [], int $limit = 50, int $offset = 0): array;

    /**
     * @param array<string, mixed> $criteria
     */
    public function count(array $criteria = []): int;
}
