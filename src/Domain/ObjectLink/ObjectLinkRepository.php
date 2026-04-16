<?php

declare(strict_types=1);

namespace Core\Domain\ObjectLink;

interface ObjectLinkRepository
{
    public function save(ObjectLink $link): int;
    public function findById(int $id): ?ObjectLink;
    public function findAll(): array;
    public function delete(int $id): bool;
}
