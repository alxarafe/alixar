<?php

declare(strict_types=1);

/**
 * Rutas de la API REST — Plugin System + Legacy Fallback.
 *
 * This file is the Composition Root for the API.
 * It bootstraps the Plugin System and loads routes from active plugins.
 *
 * Legacy routes (hardcoded below) remain as fallback until each module
 * is extracted into its own plugin. As plugins are created, remove the
 * corresponding legacy block.
 */

use Core\Application\Plugin\PluginLoader;
use Core\Application\Plugin\PluginRegistry;
use Core\Application\Plugin\InMemoryHookRegistry;

$app = Flight::app();

// ── Database Connection ──────────────────────────────────────
$dbConfig = $GLOBALS['__api_config']['database'] ?? [];

$pdo = new PDO(
    sprintf('mysql:host=%s;port=%d;dbname=%s;charset=%s',
        $dbConfig['host'] ?? 'alixar_db',
        $dbConfig['port'] ?? 3306,
        $dbConfig['database'] ?? 'alixar_db',
        $dbConfig['charset'] ?? 'utf8mb4',
    ),
    $dbConfig['username'] ?? 'root',
    $dbConfig['password'] ?? 'root',
    [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        PDO::ATTR_EMULATE_PREPARES => false,
    ]
);

$tablePrefix = $dbConfig['table_prefix'] ?? '';

// ── Plugin System Bootstrap ──────────────────────────────────
$pluginsDir = dirname(__DIR__) . '/plugins';
$configDir = __DIR__;

// 1. Discover available plugins
$loader = new PluginLoader();
$discovered = $loader->discover($pluginsDir);

// 2. Build the registry
$registry = new PluginRegistry();
$registry->registerAll($discovered);

// 3. Activate configured plugins
$activePluginNames = require $configDir . '/plugins.php';
if (is_array($activePluginNames) && !empty($activePluginNames)) {
    $registry->activateAll($activePluginNames);
}

// 4. Create the hook bus
$hooks = new InMemoryHookRegistry();

// 5. Load plugins in dependency order
foreach ($registry->getLoadOrder() as $plugin) {
    // Register autoloader for this plugin
    $loader->registerAutoloader($plugin);

    // Load hooks first (so they're ready when routes emit them)
    $hookFile = $plugin->getHooksPath();
    if (file_exists($hookFile)) {
        $registerHooks = require $hookFile;
        if (is_callable($registerHooks)) {
            $registerHooks($hooks, $registry);
        }
    }

    // Load routes
    $routeFile = $plugin->getRoutesPath();
    if (file_exists($routeFile)) {
        $registerRoutes = require $routeFile;
        if (is_callable($registerRoutes)) {
            $registerRoutes($app, $pdo, $hooks, $registry);
        }
    }
}

// 6. Core routes (always present, regardless of plugins)
// Schema endpoint: serves schemas from all active plugins
$app->route('GET /api/setup/schemas', function () use ($registry) {
    $schemas = [];
    foreach ($registry->getLoadOrder() as $plugin) {
        $schemaDir = $plugin->getSchemasPath();
        if (is_dir($schemaDir)) {
            $files = glob($schemaDir . '/*.json');
            if ($files) {
                foreach ($files as $file) {
                    $key = basename($file, '.json');
                    $content = file_get_contents($file);
                    if ($content !== false) {
                        $decoded = json_decode($content, true);
                        if ($decoded !== null) {
                            $schemas[$key] = $decoded;
                        }
                    }
                }
            }
        }
    }
    Flight::json($schemas);
});

// Plugin introspection endpoint
$app->route('GET /api/setup/plugins', function () use ($registry) {
    $plugins = [];
    foreach ($registry->getDiscovered() as $name => $manifest) {
        $plugins[] = [
            'name' => $manifest->name,
            'displayName' => $manifest->displayName,
            'version' => $manifest->version,
            'description' => $manifest->description,
            'icon' => $manifest->icon,
            'active' => $registry->isActive($name),
            'requires' => $manifest->requires,
            'optionalDeps' => $manifest->optionalDeps,
        ];
    }
    Flight::json($plugins);
});

// ═══════════════════════════════════════════════════════════════
// CORE ROUTES (not plugin-managed)
// ═══════════════════════════════════════════════════════════════

$configPort = new \Core\Infrastructure\Persistence\Mysql\MysqlConfigurationAdapter($pdo);

// ── Setup (Menus) — Will migrate to core module later ────────
$menuAdapter = new \Core\Infrastructure\Persistence\Mysql\Menu\MysqlLegacyDolibarrMenuAdapter($pdo, $configPort, $tablePrefix);
$getNavigationTree = new \Core\Application\Menu\GetNavigationTree($menuAdapter);
$setupCtrl = new \Core\Infrastructure\Http\Api\Controller\SetupApiController($getNavigationTree);

$app->route('GET /api/setup/menus', [$setupCtrl, 'getMenus']);

