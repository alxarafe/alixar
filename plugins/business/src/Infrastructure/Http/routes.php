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
    $thirdPartyRepo = new \Plugin\Business\Infrastructure\Persistence\Mysql\ThirdParty\MysqlThirdPartyRepository($pdo);
    $thirdPartyValidator = new \Plugin\Business\Domain\ThirdParty\ThirdPartyValidator($thirdPartyRepo, $configPort, $codeGenerator);
    $bankAccountRepo = new \Plugin\Business\Infrastructure\Persistence\Mysql\BankAccount\MysqlBankAccountRepository($pdo);
    $categoryRepo = new \Plugin\Business\Infrastructure\Persistence\Mysql\Category\MysqlThirdPartyCategoryRepository($pdo);
    $representativeRepo = new \Plugin\Business\Infrastructure\Persistence\Mysql\User\MysqlThirdPartyRepresentativeRepository($pdo);

    $thirdPartyCtrl = new \Plugin\Business\Infrastructure\Http\Api\Controller\ThirdPartyApiController(
        $thirdPartyRepo, $thirdPartyValidator, $bankAccountRepo, $categoryRepo, $representativeRepo
    );

    $app->route('GET /api/v1/thirdparties', [$thirdPartyCtrl, 'list']);
    $app->route('GET /api/v1/thirdparties/@id', [$thirdPartyCtrl, 'show']);
    $app->route('POST /api/v1/thirdparties', [$thirdPartyCtrl, 'create']);
    $app->route('PUT /api/v1/thirdparties/@id', [$thirdPartyCtrl, 'update']);
    $app->route('DELETE /api/v1/thirdparties/@id', [$thirdPartyCtrl, 'destroy']);

    $app->route('GET /api/v1/thirdparties/@id/bankaccounts', [$thirdPartyCtrl, 'getBankAccounts']);
    $app->route('POST /api/v1/thirdparties/@id/bankaccounts', [$thirdPartyCtrl, 'postBankAccount']);
    $app->route('PUT /api/v1/thirdparties/@id/bankaccounts/@bankaccountId', [$thirdPartyCtrl, 'putBankAccount']);
    $app->route('DELETE /api/v1/thirdparties/@id/bankaccounts/@bankaccountId', [$thirdPartyCtrl, 'deleteBankAccount']);

    $app->route('GET /api/v1/thirdparties/@id/categories', [$thirdPartyCtrl, 'getCategories']);
    $app->route('PUT /api/v1/thirdparties/@id/categories/@categoryId', [$thirdPartyCtrl, 'putCategory']);
    $app->route('DELETE /api/v1/thirdparties/@id/categories/@categoryId', [$thirdPartyCtrl, 'deleteCategory']);

    $app->route('GET /api/v1/thirdparties/@id/supplier_categories', [$thirdPartyCtrl, 'getSupplierCategories']);
    $app->route('PUT /api/v1/thirdparties/@id/supplier_categories/@categoryId', [$thirdPartyCtrl, 'putSupplierCategory']);
    $app->route('DELETE /api/v1/thirdparties/@id/supplier_categories/@categoryId', [$thirdPartyCtrl, 'deleteSupplierCategory']);

    $app->route('GET /api/v1/thirdparties/@id/representatives', [$thirdPartyCtrl, 'getRepresentatives']);
    $app->route('PUT /api/v1/thirdparties/@id/representatives/@userId', [$thirdPartyCtrl, 'putRepresentative']);
    $app->route('DELETE /api/v1/thirdparties/@id/representatives/@userId', [$thirdPartyCtrl, 'deleteRepresentative']);

    $app->route('GET /api/v1/thirdparties/@id/generateBankAccountDocument/@companybankid(/@model)', [$thirdPartyCtrl, 'generateBankAccountDocument']);
    $app->route('PUT /api/v1/thirdparties/@id/merge/@idtodelete', [$thirdPartyCtrl, 'merge']);
};
