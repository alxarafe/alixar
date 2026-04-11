<?php

declare(strict_types=1);

namespace App\Domain\Project;

/**
 * ProjectRepository — Interfaz del agregado Project.
 */
interface ProjectRepository
{
    /**
     * @return array<Project>
     */
    public function findAll(int $limit = 100, int $offset = 0, string $sortField = 'rowid', string $sortOrder = 'ASC'): array;

    /**
     * @param array<string, mixed> $criteria
     */
    public function count(array $criteria = []): int;

    public function findById(int $id): ?Project;

    public function findByRef(string $ref): ?Project;

    public function save(Project $project): void;

    public function delete(int $id): void;

    // --- Tasks (llx_projet_task) ---
    /** @return array<int, mixed> */
    public function getTasks(int $projectId): array;
    /** @param array<string, mixed> $data */
    public function addTask(int $projectId, array $data): void;
    /** @param array<string, mixed> $data */
    public function updateTask(int $projectId, int $taskId, array $data): void;
    public function deleteTask(int $projectId, int $taskId): void;
}
