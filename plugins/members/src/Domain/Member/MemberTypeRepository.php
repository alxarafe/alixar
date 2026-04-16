<?php

declare(strict_types=1);

namespace Plugin\Members\Domain\Member;

interface MemberTypeRepository
{
    public function save(MemberType $type): int;
    public function findById(int $id): ?MemberType;
    public function findAll(): array;
    public function delete(int $id): bool;
}
