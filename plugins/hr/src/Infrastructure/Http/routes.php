<?php

declare(strict_types=1);

use Core\Application\Plugin\HookRegistryInterface;
use Core\Application\Plugin\PluginRegistry;

return function (flight\Engine $app, PDO $pdo, HookRegistryInterface $hooks, PluginRegistry $registry): void {

    $dbConfig = $GLOBALS['__api_config']['database'] ?? [];
    $tablePrefix = $dbConfig['table_prefix'] ?? '';

    // Native Application: Clean DB interaction
    $repo = new \Plugin\Hr\Infrastructure\Persistence\Mysql\MysqlExpenseReportRepository($pdo);
    $ctrl = new \Plugin\Hr\Infrastructure\Http\Api\Controller\ExpenseReportApiController($repo);

    $app->route('GET /api/v1/expensereports', [$ctrl, 'list']);
    $app->route('POST /api/v1/expensereports', [$ctrl, 'create']);
    $app->route('GET /api/v1/expensereports/@id', [$ctrl, 'show']);
    $app->route('PUT /api/v1/expensereports/@id', [$ctrl, 'update']);
    $app->route('DELETE /api/v1/expensereports/@id', [$ctrl, 'destroy']);
};
