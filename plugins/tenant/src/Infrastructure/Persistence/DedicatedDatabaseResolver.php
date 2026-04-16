<?php

declare(strict_types=1);

namespace Plugin\Tenant\Infrastructure\Persistence;

use Plugin\Tenant\Domain\Tenant;
use Plugin\Tenant\Domain\TenantDatabaseResolverInterface;

/**
 * Resuelve la conexión de base de datos para tenants con estrategia 'dedicated'.
 * Cada tenant tiene su propio nombre de base de datos (y opcionalmente host/puerto distinto).
 */
final class DedicatedDatabaseResolver implements TenantDatabaseResolverInterface
{
    public function __construct(
        private readonly string $dbUser,
        private readonly string $dbPass,
        private readonly string $defaultCharset = 'utf8mb4',
    ) {
    }

    #[\Override]
    public function resolve(Tenant $tenant): \PDO
    {
        if (!$tenant->isDedicated()) {
            throw new \InvalidArgumentException("Tenant is not configured for dedicated DB strategy.");
        }

        $host = $tenant->getDatabaseHost() ?: $this->getCoreHost();
        $port = $tenant->getDatabasePort() ?: $this->getCorePort();
        $dbName = $tenant->getDatabaseName();

        if (empty($dbName)) {
            throw new \RuntimeException("Tenant '{$tenant->getName()}' is dedicated but has no database_name configured.");
        }

        $dsn = sprintf('mysql:host=%s;port=%d;dbname=%s;charset=%s', $host, $port, $dbName, $this->defaultCharset);

        return new \PDO($dsn, $this->dbUser, $this->dbPass, [
            \PDO::ATTR_ERRMODE => \PDO::ERRMODE_EXCEPTION,
            \PDO::ATTR_DEFAULT_FETCH_MODE => \PDO::FETCH_ASSOC,
            \PDO::ATTR_EMULATE_PREPARES => false,
        ]);
    }

    private function getCoreHost(): string
    {
        // Extract host from core PDO connection string or env
        return getenv('MARIADB_HOST') ?: (file_exists('/.dockerenv') ? 'alixar_db' : '127.0.0.1');
    }

    private function getCorePort(): int
    {
        return (int) (file_exists('/.dockerenv') ? 3306 : (getenv('MARIADB_PORT') ?: 3401));
    }
}
