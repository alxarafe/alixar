<?php

declare(strict_types=1);

namespace Core\Infrastructure\Http\Api\Controller;

use Flight;

class StatusApiController
{
    private string $version = '2.0.0-alpha';

    public function index(): void
    {
        Flight::json([
            'success' => [
                'code' => 200,
                'status' => 'OK',
                'name' => 'Alixar ERP',
                'version' => $this->version,
                'php_version' => PHP_VERSION,
                'server_time' => date('Y-m-d H:i:s'),
                'timestamp' => time(),
            ]
        ]);
    }

    /**
     * legacy compatibility with Dolibarr /api/status
     */
    public function dolibarrStatus(): void
    {
        Flight::json([
            'success' => [
                'code' => 200,
                'dolibarr_version' => '19.0.0-alixar-compat',
                'access_locked' => '0',
            ]
        ]);
    }
}
