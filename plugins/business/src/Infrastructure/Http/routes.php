<?php

/**
 * Business Plugin — Route Registration.
 *
 * Registers all API routes for ThirdParties, Categories, and shared business entities.
 *
 * @return \Closure(Flight, PDO, HookRegistryInterface, PluginRegistry): void
 */

declare(strict_types=1);

use Core\Application\Plugin\HookRegistryInterface;
use Core\Application\Plugin\PluginRegistry;

return function (flight\Engine $app, PDO $pdo, HookRegistryInterface $hooks, PluginRegistry $registry): void {

    $dbConfig = $GLOBALS['__api_config']['database'] ?? [];
    $tablePrefix = $dbConfig['table_prefix'] ?? '';

    $configPort = new \Plugin\DolibarrCompat\Infrastructure\Persistence\Mysql\MysqlConfigurationAdapter($pdo);

    // ── ThirdParties ─────────────────────────────────────────
    $codeGenerator = new \Plugin\Business\Application\Codification\NullThirdPartyCodeGenerator();
    $thirdPartyRepo = new \Plugin\DolibarrCompat\Infrastructure\Persistence\Mysql\Business\DolibarrMysqlThirdPartyRepository($pdo, $tablePrefix);
    $thirdPartyValidator = new \Plugin\Business\Domain\ThirdParty\ThirdPartyValidator($thirdPartyRepo, $configPort, $codeGenerator);
    $bankAccountRepo = new \Plugin\Business\Infrastructure\Persistence\Mysql\MysqlBankAccountRepository($pdo, $tablePrefix);
    $categoryRepo = new \Plugin\DolibarrCompat\Infrastructure\Persistence\Mysql\Business\DolibarrMysqlThirdPartyCategoryRepository($pdo, $tablePrefix);
    $representativeRepo = new \Plugin\Business\Infrastructure\Persistence\Mysql\User\MysqlThirdPartyRepresentativeRepository($pdo, $tablePrefix);

    $thirdPartyCtrl = new \Plugin\Business\Infrastructure\Http\Api\Controller\ThirdPartyApiController(
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
};
