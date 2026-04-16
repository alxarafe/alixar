<?php

declare(strict_types=1);

namespace Plugin\Crm\Domain\Event;

interface EventRepository
{
    /**
     * @return array<Event>
     */
    public function findAll(int $limit = 100, int $offset = 0, string $sortField = 'datep', string $sortOrder = 'DESC'): array;

    public function findById(int $id): ?Event;

    public function save(Event $event): void;

    public function delete(int $id): void;

    /**
     * @param array<string, mixed> $criteria
     */
    public function count(array $criteria = []): int;
}
