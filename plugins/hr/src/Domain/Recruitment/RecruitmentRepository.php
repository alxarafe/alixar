<?php

declare(strict_types=1);

namespace Plugin\Hr\Domain\Recruitment;

interface RecruitmentRepository
{
    public function save(Recruitment $recruitment): int;
    public function findById(int $id): ?Recruitment;
    public function findAll(int $limit = 500, int $offset = 0): array;
    public function delete(int $id): bool;
}
