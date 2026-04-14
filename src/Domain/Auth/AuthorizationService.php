<?php

declare(strict_types=1);

namespace Core\Domain\Auth;

/**
 * Domain service — Handles authorization (permission checks).
 *
 * Uses the additive model: a user's effective permissions are the union
 * of all permissions from all their assigned roles.
 * There is no "deny" — if a permission is not granted, it's simply absent.
 */
final class AuthorizationService
{
    /**
     * Check if a user has a specific permission.
     *
     * Superadmins bypass all permission checks.
     *
     * @param User   $user       The user to check
     * @param string $permissionKey Permission key like 'core.user.read'
     */
    public function can(User $user, string $permissionKey): bool
    {
        // Superadmin bypass — full access to everything
        if ($user->isSuperadmin()) {
            return true;
        }

        return in_array($permissionKey, $user->getPermissions(), true);
    }

    /**
     * Check if a user has ALL of the given permissions.
     *
     * @param User     $user
     * @param string[] $permissionKeys
     */
    public function canAll(User $user, array $permissionKeys): bool
    {
        if ($user->isSuperadmin()) {
            return true;
        }

        foreach ($permissionKeys as $key) {
            if (!in_array($key, $user->getPermissions(), true)) {
                return false;
            }
        }

        return true;
    }

    /**
     * Check if a user has ANY of the given permissions.
     *
     * @param User     $user
     * @param string[] $permissionKeys
     */
    public function canAny(User $user, array $permissionKeys): bool
    {
        if ($user->isSuperadmin()) {
            return true;
        }

        foreach ($permissionKeys as $key) {
            if (in_array($key, $user->getPermissions(), true)) {
                return true;
            }
        }

        return false;
    }

    /**
     * Check if a user has a specific role.
     *
     * @param User   $user
     * @param int    $roleId
     */
    public function hasRole(User $user, int $roleId): bool
    {
        return in_array($roleId, $user->getRoleIds(), true);
    }
}
