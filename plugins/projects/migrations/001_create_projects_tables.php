<?php

declare(strict_types=1);

return new class extends \Core\Infrastructure\Persistence\Migration\MigrationDefinition {
    public function up(\PDO $pdo): void
    {
        $sql = "
            CREATE TABLE IF NOT EXISTS `projects` (
                `id` INT AUTO_INCREMENT PRIMARY KEY,
                `third_party_id` INT NULL,
                `ref` VARCHAR(255) NOT NULL,
                `ref_ext` VARCHAR(255) NULL,
                `title` VARCHAR(255) NOT NULL,
                `status` INT NOT NULL DEFAULT 0,
                `date_start_event` DATETIME NULL,
                `date_end_event` DATETIME NULL,
                `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                `updated_at` DATETIME NULL ON UPDATE CURRENT_TIMESTAMP,
                KEY `idx_projects_ref` (`ref`),
                KEY `idx_projects_tp` (`third_party_id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

            CREATE TABLE IF NOT EXISTS `project_tasks` (
                `id` INT AUTO_INCREMENT PRIMARY KEY,
                `project_id` INT NOT NULL,
                `ref` VARCHAR(255) NULL,
                `label` VARCHAR(255) NOT NULL,
                `description` TEXT NULL,
                `date_start` DATETIME NULL,
                `date_end` DATETIME NULL,
                `planned_workload` DOUBLE NULL,
                `progress` DOUBLE NULL,
                `status` INT NOT NULL DEFAULT 0,
                `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                `updated_at` DATETIME NULL ON UPDATE CURRENT_TIMESTAMP,
                KEY `idx_project_tasks_proj` (`project_id`),
                CONSTRAINT `fk_project_tasks_proj` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
        ";
        $pdo->exec($sql);
    }

    public function down(\PDO $pdo): void
    {
        $tables = ['project_tasks', 'projects'];
        foreach ($tables as $table) {
            $pdo->exec("DROP TABLE IF EXISTS `$table`");
        }
    }
};
