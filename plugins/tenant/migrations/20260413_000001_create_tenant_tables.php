<?php

/**
 * Migración fundacional del plugin Tenant.
 *
 * Se ejecuta en la BD central (Core).
 */

declare(strict_types=1);

namespace Plugin\Tenant\Infrastructure\Persistence\Migration\migrations;

return new class {
    public function up(\PDO $pdo): void
    {
        $pdo->exec("
            CREATE TABLE IF NOT EXISTS tenant_groups (
                id          BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
                name        VARCHAR(255) NOT NULL,
                description TEXT NULL,
                created_at  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
        ");

        $pdo->exec("
            CREATE TABLE IF NOT EXISTS tenants (
                id                BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
                name              VARCHAR(255) NOT NULL,
                slug              VARCHAR(100) NOT NULL UNIQUE,
                database_strategy ENUM('dedicated','shared') DEFAULT 'dedicated',
                database_name     VARCHAR(100) NULL,
                database_host     VARCHAR(255) NULL,
                database_port     INT NULL,
                group_id          BIGINT UNSIGNED NULL,
                is_active         BOOLEAN DEFAULT TRUE,
                created_at        DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                updated_at        DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                FOREIGN KEY (group_id) REFERENCES tenant_groups(id) ON DELETE SET NULL
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
        ");

        $pdo->exec("
            CREATE TABLE IF NOT EXISTS tenant_users (
                id        BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
                tenant_id BIGINT UNSIGNED NOT NULL,
                user_id   BIGINT UNSIGNED NOT NULL,
                role_id   BIGINT UNSIGNED NULL,
                is_admin  BOOLEAN DEFAULT FALSE,
                UNIQUE KEY uk_tenant_user (tenant_id, user_id),
                FOREIGN KEY (tenant_id) REFERENCES tenants(id) ON DELETE CASCADE,
                FOREIGN KEY (user_id)   REFERENCES users(id) ON DELETE CASCADE,
                FOREIGN KEY (role_id)   REFERENCES roles(id) ON DELETE SET NULL
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
        ");
    }

    public function down(\PDO $pdo): void
    {
        $pdo->exec("DROP TABLE IF EXISTS tenant_users");
        $pdo->exec("DROP TABLE IF EXISTS tenants");
        $pdo->exec("DROP TABLE IF EXISTS tenant_groups");
    }
};
