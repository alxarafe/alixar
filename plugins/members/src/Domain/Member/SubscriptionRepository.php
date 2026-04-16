<?php

declare(strict_types=1);

namespace Plugin\Members\Domain\Member;

interface SubscriptionRepository
{
    public function save(Subscription $subscription): int;
    public function findById(int $id): ?Subscription;
    public function findByMemberId(int $memberId): array;
    public function delete(int $id): bool;
}
