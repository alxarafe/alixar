<?php

declare(strict_types=1);

namespace Plugin\Members\Domain\Member;

interface MemberRepository
{
    public function save(Member $member): int;
    public function findById(int $id): ?Member;
    public function findAll(int $limit = 500, int $offset = 0): array;
    public function delete(int $id): bool;
}
