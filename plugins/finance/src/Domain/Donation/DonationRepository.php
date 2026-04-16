<?php

declare(strict_types=1);

namespace Plugin\Finance\Domain\Donation;

interface DonationRepository
{
    public function save(Donation $donation): int;
    public function findById(int $id): ?Donation;
    public function findAll(int $limit = 500, int $offset = 0): array;
    public function delete(int $id): bool;
}
