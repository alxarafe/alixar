<?php

declare(strict_types=1);

namespace Plugin\Crm\Domain\Ticket;

interface TicketRepository
{
    public function save(Ticket $ticket): int;
    public function findById(int $id): ?Ticket;
    public function findAll(int $limit = 100, int $offset = 0): array;
    public function delete(int $id): bool;
}
