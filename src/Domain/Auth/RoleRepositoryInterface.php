<?php

declare(strict_types=1);

namespace Core\Domain\Auth;

/**
 * Port (driven) — Persistence contract for Role entities.
 */
interface RoleRepositoryInterface
{
    /**
     * Find a role by ID, including its permissions.
     */
    public function findById(int $id): ?Role;

    /**
     * Find a role by name.
     */
    public function findByName(string $name): ?Role;

    /**
     * Get all roles.
     *
     * @return Role[]
     */
    public function findAll(): array;

    /**
     * Persist a new role. Returns the role with assigned ID.
     */
    public function save(Role $role): Role;

    /**
     * Update an existing role.
     */
    public function update(Role $role): void;

    /**
     * Delete a role by ID.
     *
     * @throws \DomainException if the role is a system role
     */
    public function delete(int $id): void;

    /**
     * Sync role permissions (replace all current permissions with new set).
     *
     * @param int   $roleId
     * @param int[] $permissionIds
     */
    public function syncPermissions(int $roleId, array $permissionIds): void;

    /**
     * Get all permissions available in the system.
     *
     * @return Permission[]
     */
    public function getAllPermissions(): array;

    /**
     * Get permissions filtered by plugin.
     *
     * @return Permission[]
     */
    public function getPermissionsByPlugin(string $plugin): array;
}
