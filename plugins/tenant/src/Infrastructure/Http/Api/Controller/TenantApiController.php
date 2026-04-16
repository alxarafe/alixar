<?php

declare(strict_types=1);

namespace Plugin\Tenant\Infrastructure\Http\Api\Controller;

use Plugin\Tenant\Application\CreateTenantHandler;
use Plugin\Tenant\Application\ListUserTenantsHandler;
use Plugin\Tenant\Domain\TenantRepositoryInterface;

/**
 * API Controller para la gestión de Tenants.
 */
final class TenantApiController
{
    public function __construct(
        private readonly TenantRepositoryInterface $tenantRepository,
        private readonly CreateTenantHandler $createHandler,
        private readonly ListUserTenantsHandler $listUserTenantsHandler,
    ) {
    }

    /**
     * GET /api/tenants
     * Superadmins ven todos, usuarios normales ven a los que tienen acceso.
     */
    public function index(): void
    {
        $user = \Flight::get('auth.user');
        if (!$user) {
            \Flight::json(['error' => 'unauthorized'], 401);
            return;
        }

        if ($user->isSuperadmin()) {
            $tenants = $this->tenantRepository->findAll();
        } else {
            $tenants = $this->listUserTenantsHandler->handle($user->getId());
        }

        \Flight::json([
            'data' => array_map(fn($t) => $t->toArray(), $tenants),
        ]);
    }

    /**
     * POST /api/tenants
     * (Solo Superadmins)
     */
    public function store(): void
    {
        $user = \Flight::get('auth.user');
        if (!$user || !$user->isSuperadmin()) {
            \Flight::json(['error' => 'forbidden', 'message' => 'Superadmin required.'], 403);
            return;
        }

        $body = \Flight::request()->data->getData();

        if (empty($body['name']) || empty($body['slug'])) {
            \Flight::json(['error' => 'validation_error', 'message' => 'name and slug are required.'], 422);
            return;
        }

        try {
            /** @var array{database_host?: string, database_name?: string, database_port?: int, database_strategy?: string, group_id?: int, name: string, slug: string} $body */
            $tenant = $this->createHandler->handle($body);
            \Flight::json(['data' => $tenant->toArray(), 'message' => 'Tenant created successfully.'], 201);
        } catch (\DomainException $e) {
            \Flight::json(['error' => 'domain_error', 'message' => $e->getMessage()], 409);
        }
    }

    /**
     * GET /api/tenants/@id
     */
    public function show(int $id): void
    {
        $tenant = $this->tenantRepository->findById($id);
        if (!$tenant) {
            \Flight::json(['error' => 'not_found', 'message' => 'Tenant not found.'], 404);
            return;
        }

        $user = \Flight::get('auth.user');
        if (!$user || (!$user->isSuperadmin() && !$this->tenantRepository->isUserInTenant($id, $user->getId()))) {
            \Flight::json(['error' => 'forbidden'], 403);
            return;
        }

        \Flight::json(['data' => $tenant->toArray()]);
    }

    /**
     * POST /api/tenants/@id/users
     * Assign user to tenant. (Superadmin or Tenant Admin)
     */
    public function addUser(int $id): void
    {
        $user = \Flight::get('auth.user');
        if (!$user || !$user->isSuperadmin()) {
            \Flight::json(['error' => 'forbidden', 'message' => 'Superadmin required.'], 403);
            return;
        }

        $tenant = $this->tenantRepository->findById($id);
        if (!$tenant) {
            \Flight::json(['error' => 'not_found', 'message' => 'Tenant not found.'], 404);
            return;
        }

        $body = \Flight::request()->data->getData();
        $targetUserId = (int) ($body['user_id'] ?? 0);
        if ($targetUserId <= 0) {
            \Flight::json(['error' => 'validation_error', 'message' => 'user_id is required.'], 422);
            return;
        }

        $this->tenantRepository->addUserToTenant(
            tenantId: $id,
            userId: $targetUserId,
            roleId: isset($body['role_id']) ? (int) $body['role_id'] : null,
            isAdmin: (bool) ($body['is_admin'] ?? false)
        );

        \Flight::json(['message' => 'User added to tenant successfully.']);
    }
}
