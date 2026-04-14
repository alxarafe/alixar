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
// CORE AUTH BOOTSTRAP (JWT, Middleware, Repositories, Controllers)
// ═══════════════════════════════════════════════════════════════

$jwtConfig = $GLOBALS['__api_config']['jwt'] ?? [];

// ── Core Repositories ────────────────────────────────────────
$userRepository = new \Core\Infrastructure\Persistence\Mysql\MysqlUserRepository($pdo);
$roleRepository = new \Core\Infrastructure\Persistence\Mysql\MysqlRoleRepository($pdo);

// ── JWT Token Adapter ────────────────────────────────────────
$jwtAdapter = new \Core\Infrastructure\Auth\JwtTokenAdapter(
    secretKey: $jwtConfig['secret'] ?? 'alixar-dev-jwt-secret-change-in-production-please!',
    pdo: $pdo,
    ttl: $jwtConfig['ttl'] ?? 3600,
    issuer: $jwtConfig['issuer'] ?? 'alixar',
);

// ── Auth Middleware (protects /api/* except public routes) ────
$authMiddleware = new \Core\Infrastructure\Http\Middleware\AuthMiddleware($jwtAdapter, $userRepository);
$app->before('start', function(array &$params, ?string &$output) use ($authMiddleware) {
    if (!$authMiddleware->handle()) {
        return false;
    }
});

// ── Domain Services ──────────────────────────────────────────
$authenticationService = new \Core\Domain\Auth\AuthenticationService($userRepository);
$authorizationService = new \Core\Domain\Auth\AuthorizationService();

// ── Use Cases ────────────────────────────────────────────────
$loginHandler = new \Core\Application\Auth\LoginHandler($authenticationService, $jwtAdapter);
$registerUserHandler = new \Core\Application\Auth\RegisterUserHandler($userRepository);
$assignRoleHandler = new \Core\Application\Auth\AssignRoleHandler($userRepository, $roleRepository);

// ── API Controllers ──────────────────────────────────────────
$authController = new \Core\Infrastructure\Http\Api\Controller\AuthApiController($loginHandler, $jwtAdapter);
$userController = new \Core\Infrastructure\Http\Api\Controller\UserApiController(
    $userRepository, $registerUserHandler, $assignRoleHandler, $authorizationService
);
$roleController = new \Core\Infrastructure\Http\Api\Controller\RoleApiController(
    $roleRepository, $authorizationService
);

// ── Register Core Auth Routes ────────────────────────────────
$registerCoreRoutes = require dirname(__DIR__) . '/src/Infrastructure/Http/routes.php';

// ═══════════════════════════════════════════════════════════════
// CORE i18n BOOTSTRAP (Translations)
// ═══════════════════════════════════════════════════════════════

// ── Translation Adapter (DB + YAML hybrid) ───────────────────
$translationAdapter = new \Core\Infrastructure\Persistence\I18n\DatabaseTranslationAdapter($pdo);

// ── Import Core YAML translations on first request ───────────
// TODO: Move this to a migration or CLI command for production
$coreTranslationsDir = dirname(__DIR__) . '/src/Resources/translations';
foreach (['en', 'es'] as $lang) {
    $yamlFile = $coreTranslationsDir . '/' . $lang . '/core.yaml';
    if (file_exists($yamlFile)) {
        $translationAdapter->importFromYaml($yamlFile, $lang, 'core');
    }
}

// ── Core Translator ──────────────────────────────────────────
$coreTranslator = new \Core\Application\I18n\CoreTranslator($translationAdapter, 'en');

// ── i18n API Controller ──────────────────────────────────────
$i18nController = new \Core\Infrastructure\Http\Api\Controller\I18nApiController(
    $coreTranslator, $translationAdapter, $authorizationService
);

// ── Whitelist i18n public routes ─────────────────────────────
$authMiddleware->addPublicRoute('/api/i18n');

// ── Register all Core routes (Auth + i18n) ───────────────────
$registerCoreRoutes($authController, $userController, $roleController, $i18nController);
