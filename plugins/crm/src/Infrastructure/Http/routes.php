<?php

/**
 * CRM Plugin — Route Registration.
 *
 * Registers all API routes for ThirdParties, Contacts, and Events.
 *
 * NOTE: This plugin currently uses App\* classes from src/ as a transitional
 * step. In a future refactoring, these classes will be moved into the plugin
 * directory and use the Plugin\Crm\* namespace.
 *
 * @return \Closure(Flight, PDO, HookRegistryInterface, PluginRegistry): void
 */

declare(strict_types=1);

use Core\Application\Plugin\HookRegistryInterface;
use Core\Application\Plugin\PluginRegistry;

return function (flight\Engine $app, PDO $pdo, HookRegistryInterface $hooks, PluginRegistry $registry): void {

    $dbConfig = $GLOBALS['__api_config']['database'] ?? [];
    $tablePrefix = $dbConfig['table_prefix'] ?? '';



    // ── Contacts ─────────────────────────────────────────────
    $contactRepo = new \Plugin\DolibarrCompat\Infrastructure\Persistence\Mysql\Crm\DolibarrMysqlContactRepository($pdo, $tablePrefix);
    $contactCategoryRepo = new \Plugin\DolibarrCompat\Infrastructure\Persistence\Mysql\Crm\DolibarrMysqlContactCategoryRepository($pdo, $tablePrefix);
    $contactCtrl = new \Plugin\Crm\Infrastructure\Http\Api\Controller\ContactApiController($contactRepo, $contactCategoryRepo);

    $app->route('GET /api/contacts', [$contactCtrl, 'list']);
    $app->route('GET /api/contacts/@id', [$contactCtrl, 'show']);
    $app->route('POST /api/contacts', [$contactCtrl, 'create']);
    $app->route('PUT /api/contacts/@id', [$contactCtrl, 'update']);
    $app->route('DELETE /api/contacts/@id', [$contactCtrl, 'destroy']);

    $app->route('GET /api/contacts/email/@email', [$contactCtrl, 'getByEmail']);
    $app->route('POST /api/contacts/@id/createUser', [$contactCtrl, 'createUser']);
    $app->route('GET /api/contacts/@id/categories', [$contactCtrl, 'getCategories']);
    $app->route('PUT /api/contacts/@id/categories/@categoryId', [$contactCtrl, 'putCategory']);
    $app->route('DELETE /api/contacts/@id/categories/@categoryId', [$contactCtrl, 'deleteCategory']);

    // ── Events / Agenda ──────────────────────────────────────
    $eventRepo = new \Plugin\DolibarrCompat\Infrastructure\Persistence\Mysql\Crm\DolibarrMysqlEventRepository($pdo, $tablePrefix);
    $eventCtrl = new \Plugin\Crm\Infrastructure\Http\Api\Controller\EventApiController($eventRepo);

    $app->route('GET /api/events', [$eventCtrl, 'list']);
    $app->route('POST /api/events', [$eventCtrl, 'create']);
    $app->route('GET /api/events/@id', [$eventCtrl, 'show']);
    $app->route('PUT /api/events/@id', [$eventCtrl, 'update']);
    $app->route('DELETE /api/events/@id', [$eventCtrl, 'destroy']);
};
