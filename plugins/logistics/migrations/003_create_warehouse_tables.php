<?php

declare(strict_types=1);

return new class extends \Core\Infrastructure\Persistence\Migration\MigrationDefinition {
    public function up(\PDO $pdo): void
    {
        $sql = "
            CREATE TABLE IF NOT EXISTS `warehouses` (
                `id` INT AUTO_INCREMENT PRIMARY KEY,
                `ref` VARCHAR(255) NOT NULL,
                `label` VARCHAR(255) NOT NULL,
                `description` TEXT NULL,
                `address` TEXT NULL,
                `zip_code` VARCHAR(50) NULL,
                `city` VARCHAR(255) NULL,
                `parent_id` INT NULL,
                `status` INT NOT NULL DEFAULT 1,
                `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                `updated_at` DATETIME NULL ON UPDATE CURRENT_TIMESTAMP,
                KEY `idx_warehouses_ref` (`ref`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

            CREATE TABLE IF NOT EXISTS `stock_movements` (
                `id` INT AUTO_INCREMENT PRIMARY KEY,
                `product_id` INT NOT NULL,
                `warehouse_id` INT NOT NULL,
                `qty` DOUBLE NOT NULL,
                `type` INT NOT NULL,
                `label` VARCHAR(255) NULL,
                `inventory_code` VARCHAR(255) NULL,
                `price` DOUBLE NOT NULL DEFAULT 0,
                `date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                KEY `idx_stock_mov_prod` (`product_id`),
                KEY `idx_stock_mov_whs` (`warehouse_id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
        ";
        $pdo->exec($sql);
    }

    public function down(\PDO $pdo): void
    {
        $pdo->exec("DROP TABLE IF EXISTS `stock_movements`");
        $pdo->exec("DROP TABLE IF EXISTS `warehouses`");
    }
};
