<?php

declare(strict_types=1);

namespace Plugin\Tenant\Application;

use Plugin\Tenant\Domain\Tenant;
use Plugin\Tenant\Domain\TenantRepositoryInterface;

/**
 * Use case: Create a new tenant.
 */
final class CreateTenantHandler
{
    public function __construct(
        private readonly TenantRepositoryInterface $tenantRepository,
    ) {
    }

    /**
     * @param array{
     *     name: string,
     *     slug: string,
     *     database_strategy?: string,
     *     database_name?: string,
     *     database_host?: string,
     *     database_port?: int,
     *     group_id?: int
     * } $data
     * @return Tenant The newly created tenant
     * @throws \DomainException if slug already exists
     */
    public function handle(array $data): Tenant
    {
        if ($this->tenantRepository->findBySlug($data['slug']) !== null) {
            throw new \DomainException("Tenant with slug '{$data['slug']}' already exists.");
        }

        $tenant = Tenant::createNew(
            name: $data['name'],
            slug: $data['slug'],
            databaseStrategy: $data['database_strategy'] ?? Tenant::STRATEGY_DEDICATED,
            databaseName: $data['database_name'] ?? null,
            databaseHost: $data['database_host'] ?? null,
            databasePort: $data['database_port'] ?? null,
            groupId: $data['group_id'] ?? null,
        );

        return $this->tenantRepository->save($tenant);
    }
}
