<?php

declare(strict_types=1);

return new class extends \Core\Infrastructure\Persistence\Migration\MigrationDefinition {
    public function up(\PDO $pdo): void
    {
        $sql = "
            CREATE TABLE IF NOT EXISTS `project_tasks` (
                `id` INT AUTO_INCREMENT PRIMARY KEY,
                `ref` VARCHAR(255) NOT NULL,
                `label` VARCHAR(255) NOT NULL,
                `project_id` INT NOT NULL,
                `description` TEXT NULL,
                `date_start` DATETIME NULL,
                `date_end` DATETIME NULL,
                `progress` INT NOT NULL DEFAULT 0,
                `priority` INT NOT NULL DEFAULT 0,
                `duration` DOUBLE NOT NULL DEFAULT 0,
                `parent_id` INT NULL,
                `status` INT NOT NULL DEFAULT 1,
                `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                `updated_at` DATETIME NULL ON UPDATE CURRENT_TIMESTAMP,
                KEY `idx_project_tasks_ref` (`ref`),
                KEY `idx_project_tasks_proj` (`project_id`),
                CONSTRAINT `fk_project_tasks_parent` FOREIGN KEY (`parent_id`) REFERENCES `project_tasks` (`id`) ON DELETE CASCADE
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
        ";
        $pdo->exec($sql);
    }

    public function down(\PDO $pdo): void
    {
        $pdo->exec("DROP TABLE IF EXISTS `project_tasks`");
    }
};
