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
    $contactRepo = new \Plugin\Crm\Infrastructure\Persistence\Mysql\Contact\MysqlContactRepository($pdo);
    $contactCategoryRepo = new \Plugin\Crm\Infrastructure\Persistence\Mysql\Category\MysqlContactCategoryRepository($pdo);
    $contactCtrl = new \Plugin\Crm\Infrastructure\Http\Api\Controller\ContactApiController($contactRepo, $contactCategoryRepo);

    $app->route('GET /api/v1/contacts', [$contactCtrl, 'list']);
    $app->route('GET /api/v1/contacts/@id', [$contactCtrl, 'show']);
    $app->route('POST /api/v1/contacts', [$contactCtrl, 'create']);
    $app->route('PUT /api/v1/contacts/@id', [$contactCtrl, 'update']);
    $app->route('DELETE /api/v1/contacts/@id', [$contactCtrl, 'destroy']);

    $app->route('GET /api/v1/contacts/email/@email', [$contactCtrl, 'getByEmail']);
    $app->route('POST /api/v1/contacts/@id/createUser', [$contactCtrl, 'createUser']);
    $app->route('GET /api/v1/contacts/@id/categories', [$contactCtrl, 'getCategories']);
    $app->route('PUT /api/v1/contacts/@id/categories/@categoryId', [$contactCtrl, 'putCategory']);
    $app->route('DELETE /api/v1/contacts/@id/categories/@categoryId', [$contactCtrl, 'deleteCategory']);

    // ── Events / Agenda ──────────────────────────────────────
    $eventRepo = new \Plugin\Crm\Infrastructure\Persistence\Mysql\Event\MysqlEventRepository($pdo);
    $eventCtrl = new \Plugin\Crm\Infrastructure\Http\Api\Controller\EventApiController($eventRepo);

    $app->route('GET /api/v1/events', [$eventCtrl, 'list']);
    $app->route('POST /api/v1/events', [$eventCtrl, 'create']);
    $app->route('GET /api/v1/events/@id', [$eventCtrl, 'show']);
    $app->route('PUT /api/v1/events/@id', [$eventCtrl, 'update']);
    $app->route('DELETE /api/v1/events/@id', [$eventCtrl, 'destroy']);
};
