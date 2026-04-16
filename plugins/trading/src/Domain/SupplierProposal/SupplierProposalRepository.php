<?php

declare(strict_types=1);

namespace Plugin\Trading\Domain\SupplierProposal;

interface SupplierProposalRepository
{
    public function save(SupplierProposal $proposal): int;
    public function findById(int $id): ?SupplierProposal;
    public function findAll(int $limit = 100, int $offset = 0): array;
    public function delete(int $id): bool;
}
