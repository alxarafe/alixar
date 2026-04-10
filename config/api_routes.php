<?php

declare(strict_types=1);

/**
 * Rutas de la API REST — Módulos hexagonales.
 *
 * Cada Bounded Context registra sus rutas aquí.
 * Se carga desde public/api.php.
 *
 * Las rutas siguen el formato de la API de Dolibarr:
 *   GET    /api/{resource}       → listar
 *   GET    /api/{resource}/{id}  → obtener
 *   POST   /api/{resource}       → crear
 *   PUT    /api/{resource}/{id}  → actualizar
 *   DELETE /api/{resource}/{id}  → eliminar
 */

$app = Flight::app();

// ── ThirdParties ─────────────────────────────────────────────
// Composition root: conectar puerto con adaptador
$dbConfig = $GLOBALS['__api_config']['database'] ?? [];

$pdo = new PDO(
    sprintf('mysql:host=%s;port=%d;dbname=%s;charset=%s',
        $dbConfig['host'] ?? 'alixar_db',
        $dbConfig['port'] ?? 3306,
        $dbConfig['database'] ?? 'alixar_db',
        $dbConfig['charset'] ?? 'utf8mb4',
    ),
    $dbConfig['username'] ?? 'root',
    $dbConfig['password'] ?? 'root',
    [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        PDO::ATTR_EMULATE_PREPARES => false,
    ]
);

$configPort = new \App\Infrastructure\Persistence\Mysql\MysqlConfigurationAdapter($pdo);
$codeGenerator = new \App\Application\Codification\NullThirdPartyCodeGenerator();

$thirdPartyRepo = new \App\Infrastructure\Persistence\Mysql\MysqlThirdPartyRepository($pdo);
$thirdPartyValidator = new \App\Domain\ThirdParty\ThirdPartyValidator($thirdPartyRepo, $configPort, $codeGenerator);

$thirdPartyCtrl = new \App\Infrastructure\Http\Api\Controller\ThirdPartyApiController($thirdPartyRepo, $thirdPartyValidator);

$app->route('GET /api/thirdparties', [$thirdPartyCtrl, 'list']);
$app->route('GET /api/thirdparties/@id', [$thirdPartyCtrl, 'show']);
$app->route('POST /api/thirdparties', [$thirdPartyCtrl, 'create']);
$app->route('PUT /api/thirdparties/@id', [$thirdPartyCtrl, 'update']);
$app->route('DELETE /api/thirdparties/@id', [$thirdPartyCtrl, 'destroy']);

// ── Contacts ─────────────────────────────────────────────────
$contactRepo = new \App\Infrastructure\Persistence\Mysql\MysqlContactRepository($pdo);
$contactCtrl = new \App\Infrastructure\Http\Api\Controller\ContactApiController($contactRepo);

$app->route('GET /api/contacts', [$contactCtrl, 'list']);
$app->route('GET /api/contacts/@id', [$contactCtrl, 'show']);
$app->route('POST /api/contacts', [$contactCtrl, 'create']);
$app->route('PUT /api/contacts/@id', [$contactCtrl, 'update']);
$app->route('DELETE /api/contacts/@id', [$contactCtrl, 'destroy']);

// ── Invoices ─────────────────────────────────────────────────
$invoiceRepo = new \App\Infrastructure\Persistence\Mysql\MysqlInvoiceRepository($pdo);
$invoiceCtrl = new \App\Infrastructure\Http\Api\Controller\InvoiceApiController($invoiceRepo);

$app->route('GET /api/invoices', [$invoiceCtrl, 'list']);
$app->route('GET /api/invoices/@id', [$invoiceCtrl, 'show']);
$app->route('POST /api/invoices', [$invoiceCtrl, 'create']);
$app->route('PUT /api/invoices/@id', [$invoiceCtrl, 'update']);
$app->route('DELETE /api/invoices/@id', [$invoiceCtrl, 'destroy']);
$app->route('POST /api/invoices/@id/lines', [$invoiceCtrl, 'postLine']);
$app->route('POST /api/invoices/@id/validate', [$invoiceCtrl, 'validate']);
$app->route('POST /api/invoices/@id/settopaid', [$invoiceCtrl, 'setPaid']);

