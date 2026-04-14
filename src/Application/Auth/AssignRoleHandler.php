<?php

declare(strict_types=1);

namespace Core\Application\Auth;

use Core\Domain\Auth\RoleRepositoryInterface;
use Core\Domain\Auth\UserRepositoryInterface;

/**
 * Use case: Assign/sync roles for a user.
 *
 * Replaces the user's current roles with the specified set.
 * Validates that all role IDs exist before assignment.
 */
final class AssignRoleHandler
{
    public function __construct(
        private readonly UserRepositoryInterface $userRepository,
        private readonly RoleRepositoryInterface $roleRepository,
    ) {
    }

    /**
     * @param int   $userId  The user to assign roles to
     * @param int[] $roleIds The role IDs to assign
     * @throws \DomainException if the user or any role doesn't exist
     */
    public function handle(int $userId, array $roleIds): void
    {
        // Verify user exists
        $user = $this->userRepository->findById($userId);
        if ($user === null) {
            throw new \DomainException("User with ID {$userId} not found.");
        }

        // Verify all roles exist
        foreach ($roleIds as $roleId) {
            $role = $this->roleRepository->findById((int) $roleId);
            if ($role === null) {
                throw new \DomainException("Role with ID {$roleId} not found.");
            }
        }

        // Sync roles
        $this->userRepository->syncRoles($userId, $roleIds);
    }
}
