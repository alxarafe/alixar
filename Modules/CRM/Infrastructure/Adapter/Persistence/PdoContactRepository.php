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

namespace Modules\CRM\Infrastructure\Adapter\Persistence;

use Alxarafe\Domain\Port\Driven\PersistencePort;
use Modules\CRM\Domain\Model\Contact;
use Modules\CRM\Domain\Port\Driven\ContactRepositoryInterface;

/**
 * PdoContactRepository — Infrastructure adapter for Contact persistence.
 *
 * Maps to the Dolibarr `socpeople` table with primary key `rowid`.
 */
class PdoContactRepository implements ContactRepositoryInterface
{
    private const TABLE = 'socpeople';

    public function __construct(private PersistencePort $db)
    {
    }

    public function findById(int $id): ?Contact
    {
        $row = $this->db->findById(self::TABLE, $id);
        return $row ? Contact::fromArray($row) : null;
    }

    /**
     * @return Contact[]
     */
    public function findByThirdPartyId(int $thirdPartyId): array
    {
        $rows = $this->db->findBy(self::TABLE, ['fk_soc' => $thirdPartyId], ['lastname' => 'ASC']);
        return array_map(fn(array $row) => Contact::fromArray($row), $rows);
    }

    public function save(Contact $contact): void
    {
        $data = $contact->toArray();

        if ($contact->getId() === null) {
            unset($data['rowid']);
            $id = $this->db->insert(self::TABLE, $data);
            $contact->setId((int) $id);
        } else {
            unset($data['rowid']);
            $this->db->update(self::TABLE, $contact->getId(), $data);
        }
    }

    public function delete(int $id): void
    {
        $this->db->delete(self::TABLE, $id);
    }

    /**
     * @param array<string, mixed> $filters
     * @return Contact[]
     */
    public function findAll(array $filters = [], int $limit = 50, int $offset = 0): array
    {
        $rows = $this->db->findBy(
            self::TABLE,
            $filters,
            ['lastname' => 'ASC'],
            $limit,
            $offset
        );

        return array_map(fn(array $row) => Contact::fromArray($row), $rows);
    }

    /**
     * @param array<string, mixed> $criteria
     */
    public function count(array $criteria = []): int
    {
        return $this->db->count(self::TABLE, $criteria);
    }
}
