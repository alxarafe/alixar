<?php

declare(strict_types=1);

use Core\Application\Plugin\HookRegistryInterface;
use Core\Application\Plugin\PluginRegistry;

return function (flight\Engine $app, PDO $pdo, HookRegistryInterface $hooks, PluginRegistry $registry): void {

    $dbConfig = $GLOBALS['__api_config']['database'] ?? [];
    $tablePrefix = $dbConfig['table_prefix'] ?? '';

    $bankRepo = new \Plugin\Finance\Infrastructure\Persistence\Mysql\MysqlTreasuryBankAccountRepository($pdo, $tablePrefix);
    $bankCtrl = new \Plugin\Finance\Infrastructure\Http\Api\Controller\BankAccountApiController($bankRepo);

    $app->route('GET /api/bankaccounts', [$bankCtrl, 'list']);
    $app->route('POST /api/bankaccounts', [$bankCtrl, 'create']);
    $app->route('GET /api/bankaccounts/@id', [$bankCtrl, 'show']);
    $app->route('PUT /api/bankaccounts/@id', [$bankCtrl, 'update']);
    $app->route('DELETE /api/bankaccounts/@id', [$bankCtrl, 'destroy']);

    $app->route('GET /api/bankaccounts/@id/transactions', [$bankCtrl, 'getTransactions']);
    $app->route('POST /api/bankaccounts/@id/transactions', [$bankCtrl, 'postTransaction']);
    $app->route('PUT /api/bankaccounts/@id/transactions/@transactionId', [$bankCtrl, 'putTransaction']);
    $app->route('DELETE /api/bankaccounts/@id/transactions/@transactionId', [$bankCtrl, 'deleteTransaction']);
};
