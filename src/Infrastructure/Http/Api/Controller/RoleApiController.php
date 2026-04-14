<?php

declare(strict_types=1);

namespace Core\Infrastructure\Http\Api\Controller;

use Core\Domain\Auth\AuthorizationService;
use Core\Domain\Auth\RoleRepositoryInterface;

/**
 * REST controller for role and permission management.
 *
 * Endpoints:
 * - GET    /api/roles              — List all roles
 * - POST   /api/roles              — Create a new role
 * - GET    /api/roles/@id          — Get a single role
 * - PUT    /api/roles/@id          — Update a role
 * - DELETE /api/roles/@id          — Delete a role
 * - PUT    /api/roles/@id/permissions — Sync permissions for a role
 * - GET    /api/permissions        — List all permissions
 * - GET    /api/permissions/@plugin — List permissions for a plugin
 */
final class RoleApiController
{
    public function __construct(
        private readonly RoleRepositoryInterface $roleRepository,
        private readonly AuthorizationService $authzService,
    ) {
    }

    /**
     * GET /api/roles
     */
    public function index(): void
    {
        $this->requirePermission('core.role.read');

        $roles = $this->roleRepository->findAll();

        \Flight::json([
            'data' => array_map(fn($r) => $r->toArray(), $roles),
        ]);
    }

    /**
     * POST /api/roles
     */
    public function store(): void
    {
        $this->requirePermission('core.role.create');

        $body = \Flight::request()->data->getData();

        if (empty($body['name'])) {
            \Flight::json([
                'error'   => 'validation_error',
                'message' => "Field 'name' is required.",
            ], 422);
            return;
        }

        // Check uniqueness
        if ($this->roleRepository->findByName($body['name']) !== null) {
            \Flight::json([
                'error'   => 'domain_error',
                'message' => "Role '{$body['name']}' already exists.",
            ], 409);
            return;
        }

        $role = new \Core\Domain\Auth\Role(
            id: null,
            name: $body['name'],
            description: $body['description'] ?? null,
            isSystem: false,
        );

        $role = $this->roleRepository->save($role);

        \Flight::json([
            'data'    => $role->toArray(),
            'message' => 'Role created successfully.',
        ], 201);
    }

    /**
     * GET /api/roles/@id
     */
    public function show(int $id): void
    {
        $this->requirePermission('core.role.read');

        $role = $this->roleRepository->findById($id);
        if ($role === null) {
            \Flight::json(['error' => 'not_found', 'message' => 'Role not found.'], 404);
            return;
        }

        \Flight::json(['data' => $role->toArray()]);
    }

    /**
     * PUT /api/roles/@id
     */
    public function update(int $id): void
    {
        $this->requirePermission('core.role.update');

        $role = $this->roleRepository->findById($id);
        if ($role === null) {
            \Flight::json(['error' => 'not_found', 'message' => 'Role not found.'], 404);
            return;
        }

        $body = \Flight::request()->data->getData();

        // For now, rebuild the role with updated fields
        // (Role entity doesn't have setters for name/description to preserve immutability intent)
        $updated = new \Core\Domain\Auth\Role(
            id: $role->getId(),
            name: $body['name'] ?? $role->getName(),
            description: $body['description'] ?? $role->getDescription(),
            isSystem: $role->isSystem(),
            createdAt: $role->getCreatedAt(),
        );

        $this->roleRepository->update($updated);

        $role = $this->roleRepository->findById($id);

        \Flight::json([
            'data'    => $role->toArray(),
            'message' => 'Role updated successfully.',
        ]);
    }

    /**
     * DELETE /api/roles/@id
     */
    public function destroy(int $id): void
    {
        $this->requirePermission('core.role.delete');

        try {
            $this->roleRepository->delete($id);
            \Flight::json(['message' => 'Role deleted successfully.']);
        } catch (\DomainException $e) {
            \Flight::json([
                'error'   => 'domain_error',
                'message' => $e->getMessage(),
            ], 403);
        }
    }

    /**
     * PUT /api/roles/@id/permissions
     *
     * Body: { "permission_ids": [1, 2, 3] }
     */
    public function syncPermissions(int $id): void
    {
        $this->requirePermission('core.role.update');

        $role = $this->roleRepository->findById($id);
        if ($role === null) {
            \Flight::json(['error' => 'not_found', 'message' => 'Role not found.'], 404);
            return;
        }

        $body = \Flight::request()->data->getData();
        $permissionIds = $body['permission_ids'] ?? [];

        if (!is_array($permissionIds)) {
            \Flight::json([
                'error'   => 'validation_error',
                'message' => 'permission_ids must be an array.',
            ], 422);
            return;
        }

        $this->roleRepository->syncPermissions($id, array_map('intval', $permissionIds));

        $role = $this->roleRepository->findById($id);

        \Flight::json([
            'data'    => $role->toArray(),
            'message' => 'Permissions synced successfully.',
        ]);
    }

    /**
     * GET /api/permissions
     */
    public function listPermissions(): void
    {
        $this->requirePermission('core.permission.read');

        $permissions = $this->roleRepository->getAllPermissions();

        \Flight::json([
            'data' => array_map(fn($p) => $p->toArray(), $permissions),
        ]);
    }

    /**
     * GET /api/permissions/@plugin
     */
    public function listPermissionsByPlugin(string $plugin): void
    {
        $this->requirePermission('core.permission.read');

        $permissions = $this->roleRepository->getPermissionsByPlugin($plugin);

        \Flight::json([
            'data' => array_map(fn($p) => $p->toArray(), $permissions),
        ]);
    }

    // ── Helpers ──────────────────────────────────────────────

    private function requirePermission(string $permissionKey): void
    {
        $user = \Flight::get('auth.user');

        if ($user === null || !$this->authzService->can($user, $permissionKey)) {
            \Flight::json([
                'error'   => 'authorization_error',
                'message' => 'Insufficient permissions.',
            ], 403);
            \Flight::stop();
        }
    }
}
