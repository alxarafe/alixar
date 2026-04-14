<?php

declare(strict_types=1);

namespace Plugin\Tenant\Application;

use Plugin\Tenant\Domain\Tenant;
use Plugin\Tenant\Domain\TenantRepositoryInterface;

/**
 * Use case: List tenants a user has access to.
 */
final class ListUserTenantsHandler
{
    public function __construct(
        private readonly TenantRepositoryInterface $tenantRepository,
    ) {
    }

    /**
     * @param int $userId
     * @return Tenant[]
     */
    public function handle(int $userId): array
    {
        return $this->tenantRepository->findByUserId($userId);
    }
}
