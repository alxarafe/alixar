<?php

declare(strict_types=1);

namespace Plugin\Tenant\Domain;

/**
 * Puerto driven para persistencia de Tenants.
 */
interface TenantRepositoryInterface
{
    public function findById(int $id): ?Tenant;

    public function findBySlug(string $slug): ?Tenant;

    /**
     * @return Tenant[]
     */
    public function findAll(): array;

    /**
     * @return Tenant[]
     */
    public function findByUserId(int $userId): array;

    public function save(Tenant $tenant): Tenant;

    public function update(Tenant $tenant): void;

    public function delete(int $id): void;

    // --- Grupos ---

    public function findGroupById(int $id): ?TenantGroup;

    /**
     * @return TenantGroup[]
     */
    public function findAllGroups(): array;

    public function saveGroup(TenantGroup $group): TenantGroup;

    // --- Usuarios por Tenant ---

    public function addUserToTenant(int $tenantId, int $userId, ?int $roleId = null, bool $isAdmin = false): void;

    public function removeUserFromTenant(int $tenantId, int $userId): void;

    public function isUserInTenant(int $tenantId, int $userId): bool;

    /**
     * @return TenantUser[]
     */
    public function getTenantAccessForUser(int $userId): array;
}
