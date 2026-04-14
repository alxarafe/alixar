<?php

/**
 * Foundational migration — Creates all Core tables from scratch.
 *
 * These tables are the minimum required for the Core nucleus:
 * - users, roles, permissions, user_roles, role_permissions (Auth)
 * - plugins (Plugin registry)
 * - settings (Global configuration, replaces Dolibarr llx_const)
 * - translations (i18n hybrid system)
 * - audit_log (Action tracking)
 * - jwt_blacklist (Token revocation for stateless auth)
 *
 * All DATETIME columns store values in UTC.
 * Timezone conversion is handled at the application layer.
 */

declare(strict_types=1);

use Core\Infrastructure\Persistence\Migration\MigrationDefinition;

return new class extends MigrationDefinition {
    #[\Override]
    public function up(\PDO $pdo): void
    {
        // ── Users ────────────────────────────────────────────────────
        $pdo->exec("
            CREATE TABLE IF NOT EXISTS users (
                id              BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
                username        VARCHAR(100)  NOT NULL,
                email           VARCHAR(255)  NOT NULL,
                password_hash   VARCHAR(255)  NOT NULL,
                first_name      VARCHAR(100)  NULL,
                last_name       VARCHAR(100)  NULL,
                language        VARCHAR(10)   NOT NULL DEFAULT 'en',
                timezone        VARCHAR(50)   NOT NULL DEFAULT 'UTC',
                is_active       BOOLEAN       NOT NULL DEFAULT TRUE,
                is_superadmin   BOOLEAN       NOT NULL DEFAULT FALSE,
                last_login_at   DATETIME      NULL,
                created_at      DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP,
                updated_at      DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                UNIQUE KEY uk_users_username (username),
                UNIQUE KEY uk_users_email (email)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
        ");

        // ── Roles ────────────────────────────────────────────────────
        $pdo->exec("
            CREATE TABLE IF NOT EXISTS roles (
                id          BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
                name        VARCHAR(100) NOT NULL,
                description TEXT         NULL,
                is_system   BOOLEAN      NOT NULL DEFAULT FALSE,
                created_at  DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
                updated_at  DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                UNIQUE KEY uk_roles_name (name)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
        ");

        // ── Permissions ──────────────────────────────────────────────
        $pdo->exec("
            CREATE TABLE IF NOT EXISTS permissions (
                id          BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
                plugin      VARCHAR(100)  NOT NULL,
                resource    VARCHAR(100)  NOT NULL,
                action      VARCHAR(50)   NOT NULL,
                description VARCHAR(255)  NULL,
                created_at  DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP,
                UNIQUE KEY uk_permissions_pra (plugin, resource, action)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
        ");

        // ── User–Role pivot (N:M) ───────────────────────────────────
        $pdo->exec("
            CREATE TABLE IF NOT EXISTS user_roles (
                user_id BIGINT UNSIGNED NOT NULL,
                role_id BIGINT UNSIGNED NOT NULL,
                PRIMARY KEY (user_id, role_id),
                CONSTRAINT fk_user_roles_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
                CONSTRAINT fk_user_roles_role FOREIGN KEY (role_id) REFERENCES roles(id) ON DELETE CASCADE
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
        ");

        // ── Role–Permission pivot ────────────────────────────────────
        $pdo->exec("
            CREATE TABLE IF NOT EXISTS role_permissions (
                role_id       BIGINT UNSIGNED NOT NULL,
                permission_id BIGINT UNSIGNED NOT NULL,
                PRIMARY KEY (role_id, permission_id),
                CONSTRAINT fk_role_perms_role FOREIGN KEY (role_id)       REFERENCES roles(id)       ON DELETE CASCADE,
                CONSTRAINT fk_role_perms_perm FOREIGN KEY (permission_id) REFERENCES permissions(id) ON DELETE CASCADE
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
        ");

        // ── Plugins (persistent activation state) ────────────────────
        $pdo->exec("
            CREATE TABLE IF NOT EXISTS plugins (
                id           BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
                name         VARCHAR(100) NOT NULL,
                version      VARCHAR(20)  NOT NULL,
                is_active    BOOLEAN      NOT NULL DEFAULT TRUE,
                installed_at DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
                updated_at   DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                UNIQUE KEY uk_plugins_name (name)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
        ");

        // ── Settings (global configuration, replaces llx_const) ──────
        $pdo->exec("
            CREATE TABLE IF NOT EXISTS settings (
                id       BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
                `key`    VARCHAR(255) NOT NULL,
                value    TEXT         NULL,
                plugin   VARCHAR(100) NOT NULL DEFAULT 'core',
                type     VARCHAR(10)  NOT NULL DEFAULT 'string',
                UNIQUE KEY uk_settings_key (`key`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
        ");

        // ── Translations (i18n hybrid: YAML imported + user overrides) ─
        $pdo->exec("
            CREATE TABLE IF NOT EXISTS translations (
                id       BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
                locale   VARCHAR(10)  NOT NULL,
                `group`  VARCHAR(100) NOT NULL,
                `key`    VARCHAR(255) NOT NULL,
                value    TEXT         NOT NULL,
                UNIQUE KEY uk_translations_lgk (locale, `group`, `key`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
        ");

        // ── Audit Log ────────────────────────────────────────────────
        $pdo->exec("
            CREATE TABLE IF NOT EXISTS audit_log (
                id          BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
                user_id     BIGINT UNSIGNED NULL,
                action      VARCHAR(50)    NOT NULL,
                entity_type VARCHAR(100)   NULL,
                entity_id   BIGINT UNSIGNED NULL,
                context     JSON           NULL,
                ip_address  VARCHAR(45)    NULL,
                created_at  DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP,
                INDEX idx_audit_user (user_id),
                INDEX idx_audit_entity (entity_type, entity_id),
                INDEX idx_audit_created (created_at)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
        ");

        // ── JWT Blacklist (token revocation for logout) ──────────────
        $pdo->exec("
            CREATE TABLE IF NOT EXISTS jwt_blacklist (
                id          BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
                jti         VARCHAR(255)   NOT NULL,
                user_id     BIGINT UNSIGNED NULL,
                expires_at  DATETIME       NOT NULL,
                revoked_at  DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP,
                UNIQUE KEY uk_jwt_blacklist_jti (jti),
                INDEX idx_jwt_expires (expires_at)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
        ");

        // ── Seed: Default superadmin user ────────────────────────────
        // Password: 'admin' (bcrypt hashed)
        $hash = password_hash('admin', PASSWORD_BCRYPT);
        $stmt = $pdo->prepare("
            INSERT IGNORE INTO users (username, email, password_hash, first_name, last_name, is_superadmin)
            VALUES (:username, :email, :hash, :first, :last, TRUE)
        ");
        $stmt->execute([
            'username' => 'admin',
            'email'    => 'admin@alixar.local',
            'hash'     => $hash,
            'first'    => 'System',
            'last'     => 'Administrator',
        ]);

        // ── Seed: Default system roles ───────────────────────────────
        $pdo->exec("
            INSERT IGNORE INTO roles (name, description, is_system) VALUES
            ('superadmin', 'Full system access — cannot be deleted', TRUE),
            ('admin',      'Administrative access at tenant level',  TRUE),
            ('user',       'Standard user with assigned permissions', TRUE)
        ");

        // ── Seed: Core permissions ───────────────────────────────────
        $pdo->exec("
            INSERT IGNORE INTO permissions (plugin, resource, action, description) VALUES
            ('core', 'user',       'read',   'View users'),
            ('core', 'user',       'create', 'Create users'),
            ('core', 'user',       'update', 'Update users'),
            ('core', 'user',       'delete', 'Delete users'),
            ('core', 'role',       'read',   'View roles'),
            ('core', 'role',       'create', 'Create roles'),
            ('core', 'role',       'update', 'Update roles'),
            ('core', 'role',       'delete', 'Delete roles'),
            ('core', 'permission', 'read',   'View permissions'),
            ('core', 'plugin',     'read',   'View plugins'),
            ('core', 'plugin',     'manage', 'Activate/deactivate plugins'),
            ('core', 'setting',    'read',   'View settings'),
            ('core', 'setting',    'update', 'Modify settings'),
            ('core', 'audit',      'read',   'View audit log'),
            ('core', 'translation','read',   'View translations'),
            ('core', 'translation','update', 'Modify translations')
        ");

        // ── Seed: Assign all core permissions to superadmin role ─────
        $pdo->exec("
            INSERT IGNORE INTO role_permissions (role_id, permission_id)
            SELECT r.id, p.id
            FROM roles r
            CROSS JOIN permissions p
            WHERE r.name = 'superadmin' AND p.plugin = 'core'
        ");

        // ── Seed: Assign superadmin role to admin user ───────────────
        $pdo->exec("
            INSERT IGNORE INTO user_roles (user_id, role_id)
            SELECT u.id, r.id
            FROM users u
            CROSS JOIN roles r
            WHERE u.username = 'admin' AND r.name = 'superadmin'
        ");
    }

    #[\Override]
    public function down(\PDO $pdo): void
    {
        // Drop in reverse dependency order
        $tables = [
            'jwt_blacklist',
            'audit_log',
            'translations',
            'settings',
            'plugins',
            'role_permissions',
            'user_roles',
            'permissions',
            'roles',
            'users',
        ];

        foreach ($tables as $table) {
            $pdo->exec("DROP TABLE IF EXISTS {$table}");
        }
    }
};
