<?php

declare(strict_types=1);

namespace Core\Domain\Auth;

/**
 * Port (driven) — Persistence contract for User entities.
 */
interface UserRepositoryInterface
{
    /**
     * Find a user by ID, including their role IDs and computed permissions.
     */
    public function findById(int $id): ?User;

    /**
     * Find a user by username.
     */
    public function findByUsername(string $username): ?User;

    /**
     * Find a user by email.
     */
    public function findByEmail(string $email): ?User;

    /**
     * Find a user by username OR email (for flexible login).
     */
    public function findByUsernameOrEmail(string $identifier): ?User;

    /**
     * Persist a new user. Returns the user with assigned ID.
     */
    public function save(User $user): User;

    /**
     * Update an existing user.
     */
    public function update(User $user): void;

    /**
     * Delete a user by ID.
     */
    public function delete(int $id): void;

    /**
     * Get all users with pagination.
     *
     * @return array{items: User[], total: int}
     */
    public function findAll(int $page = 1, int $perPage = 50): array;

    /**
     * Sync user roles (replace all current roles with new set).
     *
     * @param int   $userId
     * @param int[] $roleIds
     */
    public function syncRoles(int $userId, array $roleIds): void;

    /**
     * Get the computed permission keys for a user (union of all role permissions).
     *
     * @return string[] Permission keys like ['core.user.read', 'crm.thirdparty.create']
     */
    public function getPermissionKeys(int $userId): array;

    /**
     * Update the last login timestamp.
     */
    public function updateLastLogin(int $userId): void;
}
