<?php

declare(strict_types=1);

return new class extends \Core\Infrastructure\Persistence\Migration\MigrationDefinition {
    public function up(PDO $pdo): void
    {
        // Table: finance_multicurrencies
        $pdo->exec("
            CREATE TABLE IF NOT EXISTS finance_multicurrencies (
                id INT AUTO_INCREMENT PRIMARY KEY,
                code VARCHAR(3) NOT NULL UNIQUE,
                name VARCHAR(100) NOT NULL,
                rate DECIMAL(24,8) DEFAULT 1,
                status VARCHAR(20) DEFAULT 'active',
                created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
                updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
        ");

        // Table: finance_donations
        $pdo->exec("
            CREATE TABLE IF NOT EXISTS finance_donations (
                id INT AUTO_INCREMENT PRIMARY KEY,
                ref VARCHAR(50) NOT NULL UNIQUE,
                amount DECIMAL(24,8) NOT NULL,
                third_party_id INT NULL,
                project_id INT NULL,
                status VARCHAR(20) DEFAULT 'validated',
                date DATETIME NULL,
                created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
                updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
        ");
    }

    public function down(PDO $pdo): void
    {
        $pdo->exec("DROP TABLE IF EXISTS finance_donations;");
        $pdo->exec("DROP TABLE IF EXISTS finance_multicurrencies;");
    }
};
