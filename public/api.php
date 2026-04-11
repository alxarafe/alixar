<?php

declare(strict_types=1);

/**
 * Front Controller API — Punto de entrada para la API REST hexagonal.
 *
 * Este archivo es el equivalente al api.php de Hexample, pero usando
 * FlightPHP como infraestructura HTTP en lugar de un router manual.
 *
 * El dominio y la aplicación son idénticos al frontend web:
 * mismos handlers, mismos puertos, mismas entidades.
 * Solo cambia el adaptador de entrada (JSON en vez de HTML).
 */

require_once __DIR__ . '/../vendor/autoload.php';

// Composition Root: crea las dependencias y configura la app
$config = require __DIR__ . '/../config/api.php';
$GLOBALS['__api_config'] = $config;

$app = Flight::app();

// ── Middleware Global ────────────────────────────────────────
$app->before('start', function () {
    // CORS para desarrollo
    header('Access-Control-Allow-Origin: *');
    header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS');
    header('Access-Control-Allow-Headers: Content-Type, DOLAPIKEY, Authorization');

    if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
        http_response_code(204);
        exit;
    }
});

// ── Manejo de errores ────────────────────────────────────────
$app->map('error', function (\Throwable $e) {
    if ($e instanceof \App\Domain\Exception\DomainValidationException) {
        http_response_code(422);
        header('Content-Type: application/json; charset=utf-8');
        echo json_encode([
            'error' => [
                'code' => 422,
                'message' => $e->getMessage(),
                'details' => $e->getErrors(),
            ],
        ], JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
        return;
    }

    $rawCode = (int) $e->getCode();
    $code = match (true) {
        $e instanceof \InvalidArgumentException => 422,
        $rawCode >= 400 && $rawCode < 600 => $rawCode,
        default => 500,
    };

    http_response_code($code);
    header('Content-Type: application/json; charset=utf-8');
    echo json_encode([
        'error' => [
            'code' => $code,
            'message' => $e->getMessage(),
        ],
    ], JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
});

// ── 404 en JSON ──────────────────────────────────────────────
$app->map('notFound', function () {
    Flight::json([
        'error' => [
            'code' => 404,
            'message' => 'Recurso no encontrado',
        ],
    ], 404);
});

// ── Rutas ────────────────────────────────────────────────────

// Health check
$app->route('GET /api/status', function () {
    Flight::json([
        'status' => 'ok',
        'version' => '1.0.0',
        'timestamp' => date('c'),
        'engine' => 'FlightPHP + Hexagonal',
    ]);
});

// Cargar rutas de módulos (se añadirán en Fase 2+)
$routesFile = __DIR__ . '/../config/api_routes.php';
if (file_exists($routesFile)) {
    require $routesFile;
}

// ── Arrancar ─────────────────────────────────────────────────
$app->start();
