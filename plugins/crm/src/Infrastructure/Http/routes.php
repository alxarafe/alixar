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

    $configPort = new \Core\Infrastructure\Persistence\Mysql\MysqlConfigurationAdapter($pdo);

    // ── ThirdParties ─────────────────────────────────────────
    $codeGenerator = new \Plugin\Crm\Application\Codification\NullThirdPartyCodeGenerator();
    $thirdPartyRepo = new \Plugin\Crm\Infrastructure\Persistence\Mysql\MysqlThirdPartyRepository($pdo, $tablePrefix);
    $thirdPartyValidator = new \Plugin\Crm\Domain\ThirdParty\ThirdPartyValidator($thirdPartyRepo, $configPort, $codeGenerator);
    $bankAccountRepo = new \Plugin\Crm\Infrastructure\Persistence\Mysql\MysqlBankAccountRepository($pdo, $tablePrefix);
    $categoryRepo = new \Plugin\Crm\Infrastructure\Persistence\Mysql\Category\MysqlThirdPartyCategoryRepository($pdo, $tablePrefix);
    $representativeRepo = new \Plugin\Crm\Infrastructure\Persistence\Mysql\User\MysqlThirdPartyRepresentativeRepository($pdo, $tablePrefix);

    $thirdPartyCtrl = new \Plugin\Crm\Infrastructure\Http\Api\Controller\ThirdPartyApiController(
        $thirdPartyRepo, $thirdPartyValidator, $bankAccountRepo, $categoryRepo, $representativeRepo
    );

    $app->route('GET /api/thirdparties', [$thirdPartyCtrl, 'list']);
    $app->route('GET /api/thirdparties/@id', [$thirdPartyCtrl, 'show']);
    $app->route('POST /api/thirdparties', [$thirdPartyCtrl, 'create']);
    $app->route('PUT /api/thirdparties/@id', [$thirdPartyCtrl, 'update']);
    $app->route('DELETE /api/thirdparties/@id', [$thirdPartyCtrl, 'destroy']);

    $app->route('GET /api/thirdparties/@id/bankaccounts', [$thirdPartyCtrl, 'getBankAccounts']);
    $app->route('POST /api/thirdparties/@id/bankaccounts', [$thirdPartyCtrl, 'postBankAccount']);
    $app->route('PUT /api/thirdparties/@id/bankaccounts/@bankaccountId', [$thirdPartyCtrl, 'putBankAccount']);
    $app->route('DELETE /api/thirdparties/@id/bankaccounts/@bankaccountId', [$thirdPartyCtrl, 'deleteBankAccount']);

    $app->route('GET /api/thirdparties/@id/categories', [$thirdPartyCtrl, 'getCategories']);
    $app->route('PUT /api/thirdparties/@id/categories/@categoryId', [$thirdPartyCtrl, 'putCategory']);
    $app->route('DELETE /api/thirdparties/@id/categories/@categoryId', [$thirdPartyCtrl, 'deleteCategory']);

    $app->route('GET /api/thirdparties/@id/supplier_categories', [$thirdPartyCtrl, 'getSupplierCategories']);
    $app->route('PUT /api/thirdparties/@id/supplier_categories/@categoryId', [$thirdPartyCtrl, 'putSupplierCategory']);
    $app->route('DELETE /api/thirdparties/@id/supplier_categories/@categoryId', [$thirdPartyCtrl, 'deleteSupplierCategory']);

    $app->route('GET /api/thirdparties/@id/representatives', [$thirdPartyCtrl, 'getRepresentatives']);
    $app->route('PUT /api/thirdparties/@id/representatives/@userId', [$thirdPartyCtrl, 'putRepresentative']);
    $app->route('DELETE /api/thirdparties/@id/representatives/@userId', [$thirdPartyCtrl, 'deleteRepresentative']);

    $app->route('GET /api/thirdparties/@id/generateBankAccountDocument/@companybankid(/@model)', [$thirdPartyCtrl, 'generateBankAccountDocument']);
    $app->route('PUT /api/thirdparties/@id/merge/@idtodelete', [$thirdPartyCtrl, 'merge']);

    // ── Contacts ─────────────────────────────────────────────
    $contactRepo = new \Plugin\Crm\Infrastructure\Persistence\Mysql\MysqlContactRepository($pdo, $tablePrefix);
    $contactCategoryRepo = new \Plugin\Crm\Infrastructure\Persistence\Mysql\Category\MysqlContactCategoryRepository($pdo, $tablePrefix);
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
    $eventRepo = new \Plugin\Crm\Infrastructure\Persistence\Mysql\MysqlEventRepository($pdo, $tablePrefix);
    $eventCtrl = new \Plugin\Crm\Infrastructure\Http\Api\Controller\EventApiController($eventRepo);

    $app->route('GET /api/events', [$eventCtrl, 'list']);
    $app->route('POST /api/events', [$eventCtrl, 'create']);
    $app->route('GET /api/events/@id', [$eventCtrl, 'show']);
    $app->route('PUT /api/events/@id', [$eventCtrl, 'update']);
    $app->route('DELETE /api/events/@id', [$eventCtrl, 'destroy']);
};
