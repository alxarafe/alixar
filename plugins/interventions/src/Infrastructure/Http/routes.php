<?php

declare(strict_types=1);

use Core\Application\Plugin\HookRegistryInterface;
use Core\Application\Plugin\PluginRegistry;

return function (flight\Engine $app, PDO $pdo, HookRegistryInterface $hooks, PluginRegistry $registry): void {

    $dbConfig = $GLOBALS['__api_config']['database'] ?? [];
    $tablePrefix = $dbConfig['table_prefix'] ?? '';

    // Interventions (Native)
    $repo = new \Plugin\Interventions\Infrastructure\Persistence\Mysql\MysqlInterventionRepository($pdo);
    $ctrl = new \Plugin\Interventions\Infrastructure\Http\Api\Controller\InterventionApiController($repo);

    $app->route('GET /api/v1/interventions', [$ctrl, 'list']);
    $app->route('POST /api/v1/interventions', [$ctrl, 'create']);
    $app->route('GET /api/v1/interventions/@id', [$ctrl, 'show']);
    $app->route('PUT /api/v1/interventions/@id', [$ctrl, 'update']);
    $app->route('DELETE /api/v1/interventions/@id', [$ctrl, 'destroy']);
};
