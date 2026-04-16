<?php

declare(strict_types=1);

namespace Plugin\Trading\Domain\Contract;

interface ContractRepository
{
    /**
     * @return array<Contract>
     */
    public function findAll(array $filters = [], int $limit = 100, int $offset = 0, string $sortField = 'id', string $sortOrder = 'ASC'): array;

    public function findById(int $id): ?Contract;

    public function findByRef(string $ref): ?Contract;

    public function save(Contract $contract): void;

    public function delete(int $id): void;

    // --- Liness ---
    /**
     * @return array<ContractLine>
     */
    public function findLinesByContractId(int $contractId): array;

    public function findLineById(int $id): ?ContractLine;

    public function saveLine(ContractLine $line): void;

    public function deleteLine(int $lineId): void;
}
