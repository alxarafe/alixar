<?php

declare(strict_types=1);

use Core\Application\Plugin\HookRegistryInterface;
use Core\Application\Plugin\PluginRegistry;

return function (flight\Engine $app, PDO $pdo, HookRegistryInterface $hooks, PluginRegistry $registry): void {

    $dbConfig = $GLOBALS['__api_config']['database'] ?? [];
    $tablePrefix = $dbConfig['table_prefix'] ?? '';

    $projectRepo = new \Plugin\Projects\Infrastructure\Persistence\Mysql\MysqlProjectRepository($pdo, $tablePrefix);
    $projectCtrl = new \Plugin\Projects\Infrastructure\Http\Api\Controller\ProjectApiController($projectRepo);

    $app->route('GET /api/projects', [$projectCtrl, 'list']);
    $app->route('POST /api/projects', [$projectCtrl, 'create']);
    $app->route('GET /api/projects/@id', [$projectCtrl, 'show']);
    $app->route('PUT /api/projects/@id', [$projectCtrl, 'update']);
    $app->route('DELETE /api/projects/@id', [$projectCtrl, 'destroy']);
    $app->route('GET /api/projects/ref/@ref', [$projectCtrl, 'getByRef']);

    $app->route('GET /api/projects/@id/tasks', [$projectCtrl, 'getTasks']);
    $app->route('POST /api/projects/@id/tasks', [$projectCtrl, 'postTask']);
    $app->route('PUT /api/projects/@id/tasks/@taskId', [$projectCtrl, 'putTask']);
    $app->route('DELETE /api/projects/@id/tasks/@taskId', [$projectCtrl, 'deleteTask']);

    $app->route('POST /api/projects/@id/validate', [$projectCtrl, 'validate']);
    $app->route('POST /api/projects/@id/close', [$projectCtrl, 'close']);
};
