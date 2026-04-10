<?php

declare(strict_types=1);

namespace App\Domain\ThirdParty;

/**
 * ThirdPartyRepository — Port (interface) for ThirdParty persistence.
 *
 * This is the contract that any persistence adapter must implement.
 * The domain doesn't know if data comes from MySQL, SQLite, or an API.
 */
interface ThirdPartyRepository
{
    public function findById(int $id): ?ThirdParty;

    public function save(ThirdParty $thirdParty): void;

    public function delete(int $id): void;

    /**
     * @param array<string, mixed> $filters
     * @return ThirdParty[]
     */
    public function findAll(
        array $filters = [],
        int $limit = 100,
        int $offset = 0,
        string $sortField = 't.rowid',
        string $sortOrder = 'ASC',
    ): array;

    /**
     * @param array<string, mixed> $criteria
     */
    public function count(array $criteria = []): int;

    public function findByEmail(string $email): ?ThirdParty;

    public function findByVatNumber(string $vatNumber): ?ThirdParty;
}
