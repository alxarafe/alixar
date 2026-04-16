<?php

declare(strict_types=1);

namespace Plugin\Tenant\Infrastructure\Middleware;

use Core\Domain\Auth\AuthenticationException;
use Plugin\Tenant\Domain\TenantRepositoryInterface;
use Plugin\Tenant\Domain\TenantDatabaseResolverInterface;

/**
 * Middleware para resolver el Tenant activo de la petición.
 *
 * Busca el ID o slug del tenant en el header `X-Tenant`.
 * Si el usuario está autenticado, verifica que tenga acceso.
 * Inyecta el tenant y su conexión PDO en el contexto de Flight.
 */
final class TenantMiddleware
{
    public function __construct(
        private readonly TenantRepositoryInterface $tenantRepository,
        private readonly TenantDatabaseResolverInterface $dbResolver,
    ) {
    }

    public function handle(): bool
    {
        // Skip setup routes
        $path = parse_url($_SERVER['REQUEST_URI'] ?? '/', PHP_URL_PATH) ?: '/';
        if (str_starts_with($path, '/api/setup/')) {
            return true;
        }

        $tenantHeader = $this->extractTenantHeader();

        // If no tenant header is provided, we can either throw an error OR proceed with Core DB only.
        // For a multi-tenant system API, most business routes require a tenant.
        // We set null if none provided; let specific controllers fail if they require it.
        if (empty($tenantHeader)) {
            \Flight::set('tenant.active', null);
            return true;
        }

        $tenant = is_numeric($tenantHeader)
            ? $this->tenantRepository->findById((int) $tenantHeader)
            : $this->tenantRepository->findBySlug($tenantHeader);

        if ($tenant === null) {
            \Flight::json(['error' => 'not_found', 'message' => 'Tenant not found.'], 404);
            \Flight::stop();
            return false;
        }

        if (!$tenant->isActive()) {
            \Flight::json(['error' => 'forbidden', 'message' => 'Tenant is inactive.'], 403);
            \Flight::stop();
            return false;
        }

        // Verify user has access (if user is authenticated)
        $user = \Flight::get('auth.user');
        if ($user !== null) {
            // Superadmins can access any tenant
            if (!$user->isSuperadmin()) {
                if (!$this->tenantRepository->isUserInTenant($tenant->getId(), $user->getId())) {
                    \Flight::json(['error' => 'forbidden', 'message' => 'You do not have access to this tenant.'], 403);
                    \Flight::stop();
                    return false;
                }
            }
        }

        try {
            $tenantPdo = $this->dbResolver->resolve($tenant);
            \Flight::set('tenant.active', $tenant);
            \Flight::set('tenant.pdo', $tenantPdo); // The DB connection for this specific tenant
            return true;
        } catch (\Exception $e) {
            \Flight::json(['error' => 'server_error', 'message' => 'Failed to connect to tenant database.'], 500);
            \Flight::stop();
            return false;
        }
    }

    private function extractTenantHeader(): string
    {
        $header = $_SERVER['HTTP_X_TENANT'] ?? '';

        if (empty($header) && function_exists('getallheaders')) {
            $headers = getallheaders();
            $header = $headers['X-Tenant'] ?? $headers['x-tenant'] ?? '';
        }

        return trim($header);
    }
}
