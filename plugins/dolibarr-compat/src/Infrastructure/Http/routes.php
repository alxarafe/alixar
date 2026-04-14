<?php

/**
 * Dolibarr Compat Plugin — Route Registration.
 *
 * Expone endpoints heredados que dependen de las tablas nativas de Dolibarr
 * (como la configuración o los menús).
 */

declare(strict_types=1);

use Core\Application\Plugin\HookRegistryInterface;
use Core\Application\Plugin\PluginRegistry;

return function (flight\Engine $app, \PDO $pdo, HookRegistryInterface $hooks, PluginRegistry $registry): void {

    // Extraer prefix y config
    $dbConfig = $GLOBALS['__api_config']['database'] ?? [];
    $tablePrefix = $dbConfig['table_prefix'] ?? '';

    // Rutas de setup heredadas
    try {
        $configPort = new \Plugin\DolibarrCompat\Infrastructure\Persistence\Mysql\MysqlConfigurationAdapter($pdo);
        $menuAdapter = new \Plugin\DolibarrCompat\Infrastructure\Persistence\Mysql\Menu\MysqlLegacyDolibarrMenuAdapter($pdo, $configPort, $tablePrefix);
        
        $getNavigationTree = new \Core\Application\Menu\GetNavigationTree($menuAdapter);
        $setupCtrl = new \Core\Infrastructure\Http\Api\Controller\SetupApiController($getNavigationTree);

        // This endpoint was tightly coupled to the Vue frontend mapping, using GET /api/setup/menus
        $app->route('GET /api/setup/menus', [$setupCtrl, 'getMenus']);
    } catch (\Throwable $e) {
        // En instalaciones completamente nuevas sin Dolibarr, estas tablas (`llx_const`, `llx_menu`)
        // podrían no existir o fallar. Silenciar el error en tiempo de inicialización de rutas.
    }
};
