<?php

declare(strict_types=1);

namespace Core\Domain\Webhook;

interface WebhookRepository
{
    public function save(Webhook $webhook): int;
    public function findById(int $id): ?Webhook;
    public function findAll(): array;
    public function delete(int $id): bool;
}
