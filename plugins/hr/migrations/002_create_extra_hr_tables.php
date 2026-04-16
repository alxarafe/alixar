<?php

declare(strict_types=1);

return new class extends \Core\Infrastructure\Persistence\Migration\MigrationDefinition {
    public function up(PDO $pdo): void
    {
        // Table: hr_leaves (Holidays)
        $pdo->exec("
            CREATE TABLE IF NOT EXISTS hr_leaves (
                id INT AUTO_INCREMENT PRIMARY KEY,
                ref VARCHAR(50) NOT NULL UNIQUE,
                user_id INT NOT NULL,
                type VARCHAR(50) NOT NULL,
                date_start DATETIME NOT NULL,
                date_end DATETIME NOT NULL,
                is_half_day TINYINT(1) DEFAULT 0,
                status VARCHAR(20) DEFAULT 'draft',
                description TEXT NULL,
                created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
                updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                INDEX idx_user (user_id)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
        ");

        // Table: hr_salaries
        $pdo->exec("
            CREATE TABLE IF NOT EXISTS hr_salaries (
                id INT AUTO_INCREMENT PRIMARY KEY,
                ref VARCHAR(50) NOT NULL UNIQUE,
                user_id INT NOT NULL,
                date_start DATETIME NOT NULL,
                date_end DATETIME NOT NULL,
                amount DECIMAL(24,8) NOT NULL,
                type VARCHAR(20) DEFAULT 'monthly',
                status VARCHAR(20) DEFAULT 'draft',
                note TEXT NULL,
                created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
                updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                INDEX idx_user (user_id)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
        ");

        // Table: hr_recruitments
        $pdo->exec("
            CREATE TABLE IF NOT EXISTS hr_recruitments (
                id INT AUTO_INCREMENT PRIMARY KEY,
                ref VARCHAR(50) NOT NULL UNIQUE,
                position_id VARCHAR(50) NOT NULL,
                candidate_first_name VARCHAR(100) NOT NULL,
                candidate_last_name VARCHAR(100) NOT NULL,
                candidate_email VARCHAR(255) NOT NULL,
                status VARCHAR(20) DEFAULT 'new',
                notes TEXT NULL,
                created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
                updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
        ");
    }

    public function down(PDO $pdo): void
    {
        $pdo->exec("DROP TABLE IF EXISTS hr_recruitments;");
        $pdo->exec("DROP TABLE IF EXISTS hr_salaries;");
        $pdo->exec("DROP TABLE IF EXISTS hr_leaves;");
    }
};
