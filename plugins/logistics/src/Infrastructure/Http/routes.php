<?php

declare(strict_types=1);

use Core\Application\Plugin\HookRegistryInterface;
use Core\Application\Plugin\PluginRegistry;

return function (flight\Engine $app, PDO $pdo, HookRegistryInterface $hooks, PluginRegistry $registry): void {

    $dbConfig = $GLOBALS['__api_config']['database'] ?? [];
    $tablePrefix = $dbConfig['table_prefix'] ?? '';

    // Shipments (Native)
    $shipmentRepo = new \Plugin\Logistics\Infrastructure\Persistence\Mysql\MysqlShipmentRepository($pdo);
    $shipmentCtrl = new \Plugin\Logistics\Infrastructure\Http\Api\Controller\ShipmentApiController($shipmentRepo);

    $app->route('GET /api/v1/shipments', [$shipmentCtrl, 'list']);
    $app->route('POST /api/v1/shipments', [$shipmentCtrl, 'create']);
    $app->route('GET /api/v1/shipments/@id', [$shipmentCtrl, 'show']);
    $app->route('PUT /api/v1/shipments/@id', [$shipmentCtrl, 'update']);
    $app->route('DELETE /api/v1/shipments/@id', [$shipmentCtrl, 'destroy']);
    
    // Receptions (Native)
    $receptionRepo = new \Plugin\Logistics\Infrastructure\Persistence\Mysql\MysqlReceptionRepository($pdo);
    $receptionCtrl = new \Plugin\Logistics\Infrastructure\Http\Api\Controller\ReceptionApiController($receptionRepo);

    $app->route('GET /api/v1/receptions', [$receptionCtrl, 'list']);
    $app->route('POST /api/v1/receptions', [$receptionCtrl, 'create']);
    $app->route('GET /api/v1/receptions/@id', [$receptionCtrl, 'show']);
    $app->route('PUT /api/v1/receptions/@id', [$receptionCtrl, 'update']);
    $app->route('DELETE /api/v1/receptions/@id', [$receptionCtrl, 'destroy']);
};
