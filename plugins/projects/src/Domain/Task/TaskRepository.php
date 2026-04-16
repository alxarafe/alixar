<?php

declare(strict_types=1);

namespace Plugin\Projects\Domain\Task;

interface TaskRepository
{
    /**
     * @return array<Task>
     */
    public function findAll(int $limit = 100, int $offset = 0, string $sortField = 'id', string $sortOrder = 'ASC'): array;

    /**
     * @param array<string, mixed> $criteria
     */
    public function count(array $criteria = []): int;

    public function findById(int $id): ?Task;

    public function findByRef(string $ref): ?Task;

    /**
     * @return array<Task>
     */
    public function findByProject(int $projectId): array;

    public function save(Task $task): void;

    public function delete(int $id): void;
}
