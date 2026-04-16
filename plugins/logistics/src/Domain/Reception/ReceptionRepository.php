<?php

declare(strict_types=1);

namespace Plugin\Logistics\Domain\Reception;

interface ReceptionRepository
{
    /**
     * @return array<Reception>
     */
    public function findAll(int $limit = 100, int $offset = 0, string $sortField = 'id', string $sortOrder = 'ASC'): array;

    /**
     * @param array<string, mixed> $criteria
     */
    public function count(array $criteria = []): int;

    public function findById(int $id): ?Reception;

    public function findByRef(string $ref): ?Reception;

    public function save(Reception $reception): void;

    public function delete(int $id): void;
}
