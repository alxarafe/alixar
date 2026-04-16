<?php

declare(strict_types=1);

namespace Plugin\Mrp\Domain\Bom;

interface BomRepository
{
    public function save(Bom $bom): int;
    public function findById(int $id): ?Bom;
    public function findAll(int $limit = 500, int $offset = 0): array;
    public function delete(int $id): bool;
}
