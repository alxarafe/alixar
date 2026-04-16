<?php

namespace Plugin\DolibarrCompat\Infrastructure\Persistence\Mysql;

use Core\Application\Configuration\ConfigurationPort;
use PDO;

class MysqlConfigurationAdapter implements ConfigurationPort
{
    private PDO $pdo;
    private string $table;

    public function __construct(PDO $pdo, string $prefix = 'llx_')
    {
        $this->pdo = $pdo;
        $this->table = $prefix . 'const';
    }

    #[\Override]
    public function get(string $key, ?string $default = null): ?string
    {
        $sql = 'SELECT value FROM ' . $this->table
            . ' WHERE name = :name AND entity IN (0, 1) ORDER BY entity DESC LIMIT 1';
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute(['name' => $key]);
        $val = $stmt->fetchColumn();

        if ($val === false) {
            return $default;
        }

        return (string) $val;
    }

    #[\Override]
    public function getBool(string $key, bool $default = false): bool
    {
        $val = $this->get($key);
        if ($val === null) {
            return $default;
        }

        return in_array(strtolower($val), ['1', 'true', 'yes', 'on'], true);
    }
}
