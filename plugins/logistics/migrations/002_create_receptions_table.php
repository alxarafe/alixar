<?php

declare(strict_types=1);

return new class extends \Core\Infrastructure\Persistence\Migration\MigrationDefinition {
    public function up(\PDO $pdo): void
    {
        $sql = "CREATE TABLE IF NOT EXISTS `receptions` (
            `id` INT AUTO_INCREMENT PRIMARY KEY,
            `ref` VARCHAR(50) DEFAULT NULL,
            `ref_ext` VARCHAR(50) DEFAULT NULL,
            `third_party_id` INT NOT NULL,
            `status` INT DEFAULT 0,
            `date_creation` DATETIME DEFAULT CURRENT_TIMESTAMP,
            `date_delivery` DATETIME DEFAULT NULL,
            `tracking_number` VARCHAR(255) DEFAULT NULL,
            `tracking_url` VARCHAR(255) DEFAULT NULL,
            `weight` INT DEFAULT NULL,
            `weight_units` INT DEFAULT NULL,
            `size_w` INT DEFAULT NULL,
            `size_h` INT DEFAULT NULL,
            `size_s` INT DEFAULT NULL,
            `size_units` INT DEFAULT NULL,
            `note_private` TEXT,
            `note_public` TEXT,
            `project_id` INT DEFAULT NULL,
            `shipping_method_id` INT DEFAULT NULL
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;";
        
        $pdo->exec($sql);
    }

    public function down(\PDO $pdo): void
    {
        $pdo->exec("DROP TABLE IF EXISTS `receptions`");
    }
};
