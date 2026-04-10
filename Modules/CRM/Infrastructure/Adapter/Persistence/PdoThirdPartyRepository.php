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
use Modules\CRM\Domain\Model\ThirdParty;
use Modules\CRM\Domain\Port\Driven\ThirdPartyRepositoryInterface;

/**
 * PdoThirdPartyRepository — Infrastructure adapter for ThirdParty persistence.
 *
 * Follows the same pattern as Chascarrillo's PdoPostRepository.
 * Maps to the Dolibarr `societe` table with primary key `rowid`.
 */
class PdoThirdPartyRepository implements ThirdPartyRepositoryInterface
{
    private const TABLE = 'societe';

    public function __construct(private PersistencePort $db)
    {
    }

    public function findById(int $id): ?ThirdParty
    {
        $row = $this->db->findById(self::TABLE, $id);
        return $row ? ThirdParty::fromArray($row) : null;
    }

    public function findByCustomerCode(string $code): ?ThirdParty
    {
        $row = $this->db->findOneBy(self::TABLE, ['code_client' => $code]);
        return $row ? ThirdParty::fromArray($row) : null;
    }

    public function findBySupplierCode(string $code): ?ThirdParty
    {
        $row = $this->db->findOneBy(self::TABLE, ['code_fournisseur' => $code]);
        return $row ? ThirdParty::fromArray($row) : null;
    }

    public function save(ThirdParty $thirdParty): void
    {
        $data = $thirdParty->toArray();

        if ($thirdParty->getId() === null) {
            unset($data['rowid']);
            $id = $this->db->insert(self::TABLE, $data);
            $thirdParty->setId((int) $id);
        } else {
            unset($data['rowid']);
            $this->db->update(self::TABLE, $thirdParty->getId(), $data);
        }
    }

    public function delete(int $id): void
    {
        $this->db->delete(self::TABLE, $id);
    }

    /**
     * @param array<string, mixed> $filters Dolibarr column-name filters.
     * @return ThirdParty[]
     */
    public function findAll(array $filters = [], int $limit = 50, int $offset = 0): array
    {
        $rows = $this->db->findBy(
            self::TABLE,
            $filters,
            ['nom' => 'ASC'],
            $limit,
            $offset
        );

        return array_map(fn(array $row) => ThirdParty::fromArray($row), $rows);
    }

    /**
     * @param array<string, mixed> $criteria
     */
    public function count(array $criteria = []): int
    {
        return $this->db->count(self::TABLE, $criteria);
    }

    /**
     * Get the last sequential number used for a reference field with a given prefix.
     * Used by ReferenceGenerator to determine the next code.
     *
     * Example: for prefix "CU2603-", it finds the highest "CU2603-0042" and returns 42.
     */
    public function getLastReferenceNumber(string $field, string $prefix): int
    {
        $rows = $this->db->rawQuery(
            "SELECT `{$field}` FROM `" . self::TABLE . "` WHERE `{$field}` LIKE ? ORDER BY `{$field}` DESC LIMIT 1",
            [$prefix . '%']
        );

        if (empty($rows)) {
            return 0;
        }

        $lastRef = $rows[0][$field] ?? '';
        $numPart = substr($lastRef, strlen($prefix));

        return (int) $numPart;
    }
}
