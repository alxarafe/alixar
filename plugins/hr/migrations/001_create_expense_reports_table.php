<?php

declare(strict_types=1);

/**
 * Migration: Create expense_reports table for Hr Plugin.
 */
return new class extends \Core\Infrastructure\Persistence\Migration\MigrationDefinition {
    public function up(\PDO $pdo): void
    {
        $tableName = 'expense_reports';
        
        $sql = "CREATE TABLE IF NOT EXISTS `$tableName` (
            `id` INT AUTO_INCREMENT PRIMARY KEY,
            `ref` VARCHAR(50) DEFAULT NULL,
            `user_id` INT NOT NULL,
            `status` INT DEFAULT 0,
            `date_creation` DATETIME DEFAULT CURRENT_TIMESTAMP,
            `date_start` DATETIME DEFAULT NULL,
            `date_end` DATETIME DEFAULT NULL,
            `note_private` TEXT,
            `note_public` TEXT,
            `amount_total` DECIMAL(10, 2) DEFAULT 0.00,
            `amount_to_pay` DECIMAL(10, 2) DEFAULT 0.00,
            `project_id` INT DEFAULT NULL,
            `fk_user_author` INT DEFAULT NULL,
            `fk_user_validator` INT DEFAULT NULL
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;";
        
        $pdo->exec($sql);
    }

    public function down(\PDO $pdo): void
    {
        $tableName = 'expense_reports';
        $pdo->exec("DROP TABLE IF EXISTS `$tableName`");
    }
};
