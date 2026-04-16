<?php

declare(strict_types=1);

namespace Plugin\Interventions\Domain\Intervention;

interface InterventionRepository
{
    /**
     * @return array<Intervention>
     */
    public function findAll(int $limit = 100, int $offset = 0, string $sortField = 'id', string $sortOrder = 'ASC'): array;

    /**
     * @param array<string, mixed> $criteria
     */
    public function count(array $criteria = []): int;

    public function findById(int $id): ?Intervention;

    public function findByRef(string $ref): ?Intervention;

    public function save(Intervention $vention): void;

    public function delete(int $id): void;
}
