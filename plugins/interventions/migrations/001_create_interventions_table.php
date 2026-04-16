<?php

declare(strict_types=1);

return new class extends \Core\Infrastructure\Persistence\Migration\MigrationDefinition {
    public function up(\PDO $pdo): void
    {
        $sql = "CREATE TABLE IF NOT EXISTS `interventions` (
            `id` INT AUTO_INCREMENT PRIMARY KEY,
            `ref` VARCHAR(50) DEFAULT NULL,
            `ref_ext` VARCHAR(50) DEFAULT NULL,
            `third_party_id` INT NOT NULL,
            `status` INT DEFAULT 0,
            `title` VARCHAR(255) DEFAULT NULL,
            `date_creation` DATETIME DEFAULT CURRENT_TIMESTAMP,
            `date_valid` DATETIME DEFAULT NULL,
            `date_start` DATETIME DEFAULT NULL,
            `date_end` DATETIME DEFAULT NULL,
            `description` TEXT,
            `note_private` TEXT,
            `note_public` TEXT,
            `project_id` INT DEFAULT NULL
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;";
        
        $pdo->exec($sql);
    }

    public function down(\PDO $pdo): void
    {
        $pdo->exec("DROP TABLE IF EXISTS `interventions`");
    }
};
