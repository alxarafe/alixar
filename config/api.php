<?php

declare(strict_types=1);

/**
 * Composition Root de la API — Configuración y cableado de dependencias.
 *
 * CONCEPTO CLAVE — Composition Root:
 * Este es el ÚNICO lugar donde se deciden las implementaciones concretas.
 * Aquí se conectan los puertos con sus adaptadores.
 *
 * Ni el dominio, ni la aplicación, ni los controladores saben
 * qué implementación concreta se usa. Solo este archivo lo sabe.
 */

return [
    // ┌─────────────────────────────────────────────────┐
    // │  Configuración de la base de datos              │
    // │  Usa la misma BD MySQL que Dolibarr/Alixar      │
    // └─────────────────────────────────────────────────┘
    // Auto-detect: inside Docker → use container name; outside → localhost + exposed port
    'database' => [
        'driver' => 'mysql',
        'host' => getenv('MARIADB_HOST') ?: (file_exists('/.dockerenv') ? 'alixar_db' : '127.0.0.1'),
        'port' => (int) (file_exists('/.dockerenv') ? 3306 : (getenv('MARIADB_PORT') ?: 3401)),
        'database' => getenv('MARIADB_DATABASE') ?: 'alixar_db',
        'username' => getenv('MARIADB_USER') ?: 'root',
        'password' => getenv('MARIADB_ROOT_PASSWORD') ?: 'root',
        'charset' => 'utf8mb4',
        'table_prefix' => getenv('MARIADB_PREFIX') ?: '',
    ],

    // ┌─────────────────────────────────────────────────┐
    // │  Configuración de la API                        │
    // └─────────────────────────────────────────────────┘
    'api' => [
        'version' => '1.0.0',
        'prefix' => '/api',
        'debug' => (bool) (getenv('API_DEBUG') ?: false),
    ],
];
