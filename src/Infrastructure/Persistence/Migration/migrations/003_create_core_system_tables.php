<?php

declare(strict_types=1);

return new class extends \Core\Infrastructure\Persistence\Migration\MigrationDefinition {
    #[\Override]
    public function up(PDO $pdo): void
    {
        // Table: core_knowledge_management
        $pdo->exec("
            CREATE TABLE IF NOT EXISTS core_knowledge_management (
                id INT AUTO_INCREMENT PRIMARY KEY,
                ref VARCHAR(50) NOT NULL UNIQUE,
                title VARCHAR(255) NOT NULL,
                content TEXT NOT NULL,
                status VARCHAR(20) DEFAULT 'draft',
                created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
                updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
        ");

        // Table: core_object_links
        $pdo->exec("
            CREATE TABLE IF NOT EXISTS core_object_links (
                id INT AUTO_INCREMENT PRIMARY KEY,
                source_type VARCHAR(50) NOT NULL,
                source_id INT NOT NULL,
                target_type VARCHAR(50) NOT NULL,
                target_id INT NOT NULL,
                created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
                INDEX idx_source (source_type, source_id),
                INDEX idx_target (target_type, target_id)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
        ");

        // Table: core_email_templates
        $pdo->exec("
            CREATE TABLE IF NOT EXISTS core_email_templates (
                id INT AUTO_INCREMENT PRIMARY KEY,
                label VARCHAR(255) NOT NULL,
                subject VARCHAR(255) NOT NULL,
                content TEXT NOT NULL,
                topic VARCHAR(50) DEFAULT 'generic',
                active TINYINT(1) DEFAULT 1,
                created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
                updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
        ");

        // Table: core_webhooks
        $pdo->exec("
            CREATE TABLE IF NOT EXISTS core_webhooks (
                id INT AUTO_INCREMENT PRIMARY KEY,
                url VARCHAR(255) NOT NULL,
                events VARCHAR(255) NOT NULL,
                method VARCHAR(10) DEFAULT 'POST',
                status VARCHAR(20) DEFAULT 'active',
                created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
                updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
        ");

        // Table: core_zapier_hooks
        $pdo->exec("
            CREATE TABLE IF NOT EXISTS core_zapier_hooks (
                id INT AUTO_INCREMENT PRIMARY KEY,
                hook_url VARCHAR(255) NOT NULL,
                entity_type VARCHAR(50) NOT NULL,
                trigger_event VARCHAR(50) NOT NULL,
                active TINYINT(1) DEFAULT 1,
                created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
                updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
        ");
    }

    #[\Override]
    public function down(PDO $pdo): void
    {
        $pdo->exec("DROP TABLE IF EXISTS core_zapier_hooks;");
        $pdo->exec("DROP TABLE IF EXISTS core_webhooks;");
        $pdo->exec("DROP TABLE IF EXISTS core_email_templates;");
        $pdo->exec("DROP TABLE IF EXISTS core_object_links;");
        $pdo->exec("DROP TABLE IF EXISTS core_knowledge_management;");
    }
};
