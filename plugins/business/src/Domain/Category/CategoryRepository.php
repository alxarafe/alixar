<?php

declare(strict_types=1);

namespace Plugin\Business\Domain\Category;

/**
 * CategoryRepository — Interfaz del agregado Category.
 */
interface CategoryRepository
{
    /**
     * @return array<Category>
     */
    public function findAll(int $limit = 100, int $offset = 0, string $sortField = 'id', string $sortOrder = 'ASC'): array;

    /**
     * @param array<string, mixed> $criteria
     */
    public function count(array $criteria = []): int;

    public function findById(int $id): ?Category;

    /**
     * @return array<Category>
     */
    public function findByType(int $type): array;

    /**
     * @return array<Category>
     */
    public function findForObject(int $type, int $objectId): array;

    public function linkObject(int $categoryId, int $type, int $objectId): void;
    
    public function unlinkObject(int $categoryId, int $type, int $objectId): void;

    public function save(Category $category): void;

    public function delete(int $id): void;
}
