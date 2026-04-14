<?php

/**
 * Tenant Plugin — Route Registration.
 *
 * @return \Closure(Flight, PDO, HookRegistryInterface, PluginRegistry): void
 */

declare(strict_types=1);

use Core\Application\Plugin\HookRegistryInterface;
use Core\Application\Plugin\PluginRegistry;
use Plugin\Tenant\Application\CreateTenantHandler;
use Plugin\Tenant\Application\ListUserTenantsHandler;
use Plugin\Tenant\Infrastructure\Http\Api\Controller\TenantApiController;
use Plugin\Tenant\Infrastructure\Middleware\TenantMiddleware;
use Plugin\Tenant\Infrastructure\Persistence\DedicatedDatabaseResolver;
use Plugin\Tenant\Infrastructure\Persistence\MysqlTenantRepository;

return function (flight\Engine $app, \PDO $pdo, HookRegistryInterface $hooks, PluginRegistry $registry): void {

    // ── Dependencies ──────────────────────────────────────────
    $tenantRepository = new MysqlTenantRepository($pdo);
    
    // Auth user credentials will be determined by environment / configs
    // In a real scenario you would read DB user/pass from config
    $dbConfig = $GLOBALS['__api_config']['database'] ?? [];
    $dbUser = $dbConfig['username'] ?? 'root';
    $dbPass = $dbConfig['password'] ?? 'root';
    
    $dbResolver = new DedicatedDatabaseResolver($dbUser, $dbPass);

    // ── Middleware ────────────────────────────────────────────
    $tenantMiddleware = new TenantMiddleware($tenantRepository, $dbResolver);
    $app->before('start', function (array &$params, mixed &$output) use ($tenantMiddleware) {
        $continue = $tenantMiddleware->handle();
        if (!$continue) {
            return false;
        }
    });

    // ── Handlers ──────────────────────────────────────────────
    $createHandler = new CreateTenantHandler($tenantRepository);
    $listUserTenantsHandler = new ListUserTenantsHandler($tenantRepository);

    // ── Controller ────────────────────────────────────────────
    $tenantCtrl = new TenantApiController(
        $tenantRepository,
        $createHandler,
        $listUserTenantsHandler
    );

    // ── Routes ────────────────────────────────────────────────
    $app->route('GET    /api/tenants', [$tenantCtrl, 'index']);
    $app->route('POST   /api/tenants', [$tenantCtrl, 'store']);
    $app->route('GET    /api/tenants/@id:[0-9]+', [$tenantCtrl, 'show']);
    $app->route('POST   /api/tenants/@id:[0-9]+/users', [$tenantCtrl, 'addUser']);
};
