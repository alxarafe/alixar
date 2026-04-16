<?php

declare(strict_types=1);

namespace Plugin\Hr\Domain\Leave;

interface LeaveRepository
{
    public function save(Leave $leave): int;
    public function findById(int $id): ?Leave;
    public function findAll(int $limit = 500, int $offset = 0): array;
    public function delete(int $id): bool;
}
