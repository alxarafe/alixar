<?php

declare(strict_types=1);

return new class extends \Core\Infrastructure\Persistence\Migration\MigrationDefinition {
    public function up(PDO $pdo): void
    {
        // Table: member_types
        $pdo->exec("
            CREATE TABLE IF NOT EXISTS member_types (
                id INT AUTO_INCREMENT PRIMARY KEY,
                label VARCHAR(255) NOT NULL,
                amount DECIMAL(24,8) DEFAULT 0,
                duration VARCHAR(20) DEFAULT '1y',
                active TINYINT(1) DEFAULT 1,
                created_at DATETIME DEFAULT CURRENT_TIMESTAMP
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
        ");

        // Table: members
        $pdo->exec("
            CREATE TABLE IF NOT EXISTS members (
                id INT AUTO_INCREMENT PRIMARY KEY,
                ref VARCHAR(50) NOT NULL UNIQUE,
                type_id INT NOT NULL,
                third_party_id INT NULL,
                first_name VARCHAR(255) NOT NULL,
                last_name VARCHAR(255) NOT NULL,
                company VARCHAR(255) NULL,
                email VARCHAR(255) NULL,
                status VARCHAR(20) DEFAULT 'active',
                date_start DATETIME NULL,
                date_end DATETIME NULL,
                created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
                updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                CONSTRAINT fk_member_type FOREIGN KEY (type_id) REFERENCES member_types(id) ON DELETE RESTRICT,
                INDEX idx_thirdparty (third_party_id)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
        ");

        // Table: member_subscriptions
        $pdo->exec("
            CREATE TABLE IF NOT EXISTS member_subscriptions (
                id INT AUTO_INCREMENT PRIMARY KEY,
                member_id INT NOT NULL,
                date_start DATETIME NOT NULL,
                date_end DATETIME NOT NULL,
                amount DECIMAL(24,8) NOT NULL,
                status VARCHAR(20) DEFAULT 'active',
                created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
                updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                CONSTRAINT fk_subscription_member FOREIGN KEY (member_id) REFERENCES members(id) ON DELETE CASCADE
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
        ");
    }

    public function down(PDO $pdo): void
    {
        $pdo->exec("DROP TABLE IF EXISTS member_subscriptions;");
        $pdo->exec("DROP TABLE IF EXISTS members;");
        $pdo->exec("DROP TABLE IF EXISTS member_types;");
    }
};
