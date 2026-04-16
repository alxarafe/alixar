<?php

declare(strict_types=1);

namespace Plugin\Trading\Domain\Proposal;

/**
 * ProposalRepository — Interfaz del agregado Proposal ("Hexagonal Slim").
 */
interface ProposalRepository
{
    /**
     * @return array<Proposal>
     */
    public function findAll(int $limit = 100, int $offset = 0, string $sortField = 'rowid', string $sortOrder = 'ASC'): array;

    /**
     * @param array<string, mixed> $criteria
     */
    public function count(array $criteria = []): int;

    public function findById(int $id): ?Proposal;

    public function findByRef(string $ref): ?Proposal;

    public function save(Proposal $proposal): void;

    public function delete(int $id): void;

    // --- Lines (propaldet) ---
    /** @return array<int, mixed> */
    public function getLines(int $proposalId): array;
    /** @param array<string, mixed> $data */
    public function addLine(int $proposalId, array $data): void;
    /** @param array<string, mixed> $data */
    public function updateLine(int $proposalId, int $lineId, array $data): void;
    public function deleteLine(int $proposalId, int $lineId): void;

    // --- Contacts ---
    /** @return array<int, mixed> */
    public function getContacts(int $proposalId, string $type = ''): array;
    public function addContact(int $proposalId, int $contactId, string $type): void;
    public function deleteContact(int $proposalId, int $contactId, string $type): void;
}
