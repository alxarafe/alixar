<?php

declare(strict_types=1);

use Core\Application\Plugin\HookRegistryInterface;
use Core\Application\Plugin\PluginRegistry;

return function (flight\Engine $app, PDO $pdo, HookRegistryInterface $hooks, PluginRegistry $registry): void {

    $dbConfig = $GLOBALS['__api_config']['database'] ?? [];
    $tablePrefix = $dbConfig['table_prefix'] ?? '';

    $projectRepo = new \Plugin\Projects\Infrastructure\Persistence\Mysql\Project\MysqlProjectRepository($pdo);
    $projectCtrl = new \Plugin\Projects\Infrastructure\Http\Api\Controller\ProjectApiController($projectRepo);

    $app->route('GET /api/v1/projects', [$projectCtrl, 'list']);
    $app->route('POST /api/v1/projects', [$projectCtrl, 'create']);
    $app->route('GET /api/v1/projects/@id', [$projectCtrl, 'show']);
    $app->route('PUT /api/v1/projects/@id', [$projectCtrl, 'update']);
    $app->route('DELETE /api/v1/projects/@id', [$projectCtrl, 'destroy']);
    $app->route('GET /api/v1/projects/ref/@ref', [$projectCtrl, 'getByRef']);

    $app->route('GET /api/v1/projects/@id/tasks', [$projectCtrl, 'getTasks']);
    $app->route('POST /api/v1/projects/@id/tasks', [$projectCtrl, 'postTask']);
    $app->route('PUT /api/v1/projects/@id/tasks/@taskId', [$projectCtrl, 'putTask']);
    $app->route('DELETE /api/v1/projects/@id/tasks/@taskId', [$projectCtrl, 'deleteTask']);

    $app->route('POST /api/v1/projects/@id/validate', [$projectCtrl, 'validate']);
    $app->route('POST /api/v1/projects/@id/close', [$projectCtrl, 'close']);
};
