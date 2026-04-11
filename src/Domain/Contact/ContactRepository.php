<?php

declare(strict_types=1);

namespace App\Domain\Contact;

interface ContactRepository
{
    public function findById(int $id): ?Contact;

    public function save(Contact $contact): void;

    public function delete(int $id): void;

    /**
     * @param array<string, mixed> $filters
     * @return Contact[]
     */
    public function findAll(
        array $filters = [],
        int $limit = 100,
        int $offset = 0,
        string $sortField = 't.rowid',
        string $sortOrder = 'ASC',
    ): array;

    public function findByEmail(string $email): ?Contact;
}
