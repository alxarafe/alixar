<?php

declare(strict_types=1);

return new class extends \Core\Infrastructure\Persistence\Migration\MigrationDefinition {
    public function up(PDO $pdo): void
    {
        // Table: accounting_accounts (Chart of Accounts)
        $pdo->exec("
            CREATE TABLE IF NOT EXISTS accounting_accounts (
                id INT AUTO_INCREMENT PRIMARY KEY,
                code VARCHAR(32) NOT NULL UNIQUE,
                label VARCHAR(255) NOT NULL,
                parent_id INT NULL,
                type VARCHAR(20) DEFAULT 'asset',
                active TINYINT(1) DEFAULT 1,
                created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
                INDEX idx_parent (parent_id),
                INDEX idx_type (type)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
        ");

        // Table: accounting_journals
        $pdo->exec("
            CREATE TABLE IF NOT EXISTS accounting_journals (
                id INT AUTO_INCREMENT PRIMARY KEY,
                code VARCHAR(32) NOT NULL UNIQUE,
                label VARCHAR(255) NOT NULL,
                type VARCHAR(20) DEFAULT 'general',
                active TINYINT(1) DEFAULT 1,
                created_at DATETIME DEFAULT CURRENT_TIMESTAMP
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
        ");
    }

    public function down(PDO $pdo): void
    {
        $pdo->exec("DROP TABLE IF EXISTS accounting_journals;");
        $pdo->exec("DROP TABLE IF EXISTS accounting_accounts;");
    }
};
