<?php

declare(strict_types=1);

namespace Core\Domain\KnowledgeManagement;

interface KnowledgeManagementRepository
{
    public function save(KnowledgeManagement $km): int;
    public function findById(int $id): ?KnowledgeManagement;
    public function findAll(int $limit = 500, int $offset = 0): array;
    public function delete(int $id): bool;
}
