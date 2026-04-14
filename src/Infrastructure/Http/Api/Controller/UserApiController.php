<?php

declare(strict_types=1);

namespace Core\Infrastructure\Http\Api\Controller;

use Core\Application\Auth\AssignRoleHandler;
use Core\Application\Auth\RegisterUserHandler;
use Core\Domain\Auth\AuthorizationService;
use Core\Domain\Auth\UserRepositoryInterface;

/**
 * REST controller for user management endpoints.
 *
 * Endpoints:
 * - GET    /api/users         — List all users (paginated)
 * - POST   /api/users         — Create a new user
 * - GET    /api/users/@id     — Get a single user
 * - PUT    /api/users/@id     — Update a user
 * - DELETE /api/users/@id     — Delete a user
 * - PUT    /api/users/@id/roles — Assign roles to user
 */
final class UserApiController
{
    public function __construct(
        private readonly UserRepositoryInterface $userRepository,
        private readonly RegisterUserHandler $registerHandler,
        private readonly AssignRoleHandler $assignRoleHandler,
        private readonly AuthorizationService $authzService,
    ) {
    }

    /**
     * GET /api/users
     */
    public function index(): void
    {
        $this->requirePermission('core.user.read');

        $page = (int) (\Flight::request()->query['page'] ?? 1);
        $perPage = (int) (\Flight::request()->query['per_page'] ?? 50);

        $result = $this->userRepository->findAll($page, $perPage);

        \Flight::json([
            'data'  => array_map(fn($u) => $u->toPublicArray(), $result['items']),
            'total' => $result['total'],
            'page'  => $page,
            'per_page' => $perPage,
        ]);
    }

    /**
     * POST /api/users
     */
    public function store(): void
    {
        $this->requirePermission('core.user.create');

        $body = \Flight::request()->data->getData();

        // Validate required fields
        $required = ['username', 'email', 'password'];
        foreach ($required as $field) {
            if (empty($body[$field])) {
                \Flight::json([
                    'error'   => 'validation_error',
                    'message' => "Field '{$field}' is required.",
                ], 422);
                return;
            }
        }

        try {
            /** @var array{username: string, email: string, password: string, first_name?: string, last_name?: string, language?: string, timezone?: string, role_ids?: int[]} $body */
            $user = $this->registerHandler->handle($body);

            \Flight::json([
                'data'    => $user->toPublicArray(),
                'message' => 'User created successfully.',
            ], 201);
        } catch (\DomainException $e) {
            \Flight::json([
                'error'   => 'domain_error',
                'message' => $e->getMessage(),
            ], 409);
        }
    }

    /**
     * GET /api/users/@id
     */
    public function show(int $id): void
    {
        $this->requirePermission('core.user.read');

        $user = $this->userRepository->findById($id);
        if ($user === null) {
            \Flight::json(['error' => 'not_found', 'message' => 'User not found.'], 404);
            return;
        }

        \Flight::json(['data' => $user->toPublicArray()]);
    }

    /**
     * PUT /api/users/@id
     */
    public function update(int $id): void
    {
        $this->requirePermission('core.user.update');

        $user = $this->userRepository->findById($id);
        if ($user === null) {
            \Flight::json(['error' => 'not_found', 'message' => 'User not found.'], 404);
            return;
        }

        $body = \Flight::request()->data->getData();

        if (isset($body['first_name'])) {
            // We need to reconstruct to update — User entity handles this
        }
        if (isset($body['language'])) {
            $user->changeLanguage($body['language']);
        }
        if (isset($body['timezone'])) {
            $user->changeTimezone($body['timezone']);
        }
        if (isset($body['password']) && !empty($body['password'])) {
            $user->changePassword($body['password']);
        }
        if (isset($body['is_active'])) {
            $body['is_active'] ? $user->activate() : $user->deactivate();
        }

        $this->userRepository->update($user);

        // Reload to get updated timestamps
        $user = $this->userRepository->findById($id);

        \Flight::json([
            'data'    => $user->toPublicArray(),
            'message' => 'User updated successfully.',
        ]);
    }

    /**
     * DELETE /api/users/@id
     */
    public function destroy(int $id): void
    {
        $this->requirePermission('core.user.delete');

        $user = $this->userRepository->findById($id);
        if ($user === null) {
            \Flight::json(['error' => 'not_found', 'message' => 'User not found.'], 404);
            return;
        }

        if ($user->isSuperadmin()) {
            \Flight::json([
                'error'   => 'domain_error',
                'message' => 'Cannot delete a superadmin user.',
            ], 403);
            return;
        }

        $this->userRepository->delete($id);

        \Flight::json(['message' => 'User deleted successfully.']);
    }

    /**
     * PUT /api/users/@id/roles
     *
     * Body: { "role_ids": [1, 2, 3] }
     */
    public function assignRoles(int $id): void
    {
        $this->requirePermission('core.role.update');

        $body = \Flight::request()->data->getData();
        $roleIds = $body['role_ids'] ?? [];

        if (!is_array($roleIds)) {
            \Flight::json([
                'error'   => 'validation_error',
                'message' => 'role_ids must be an array.',
            ], 422);
            return;
        }

        try {
            $this->assignRoleHandler->handle($id, array_map('intval', $roleIds));

            \Flight::json(['message' => 'Roles assigned successfully.']);
        } catch (\DomainException $e) {
            \Flight::json([
                'error'   => 'domain_error',
                'message' => $e->getMessage(),
            ], 404);
        }
    }

    // ── Helpers ──────────────────────────────────────────────

    private function requirePermission(string $permissionKey): void
    {
        $user = \Flight::get('auth.user');

        if ($user === null || !$this->authzService->can($user, $permissionKey)) {
            throw new \Exception('Insufficient permissions.', 403);
        }
    }
}
