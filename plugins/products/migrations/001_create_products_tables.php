<?php

/**
 * Migration: Create products and related tables for Products Plugin.
 */

declare(strict_types=1);

return new class extends \Core\Infrastructure\Persistence\Migration\MigrationDefinition {
    public function up(\PDO $pdo): void
    {
        $sql = "
            CREATE TABLE IF NOT EXISTS `products` (
                `id` INT AUTO_INCREMENT PRIMARY KEY,
                `entity` INT DEFAULT 1,
                `ref` VARCHAR(128) NOT NULL,
                `ref_ext` VARCHAR(255) DEFAULT NULL,
                `barcode` VARCHAR(255) DEFAULT NULL,
                `label` VARCHAR(255) NOT NULL,
                `description` TEXT,
                `price` DECIMAL(15, 8) DEFAULT 0.00,
                `price_ttc` DECIMAL(15, 8) DEFAULT 0.00,
                `tva_tx` DECIMAL(5, 3) DEFAULT 0.00,
                `type` INT DEFAULT 0,
                `status` TINYINT(1) DEFAULT 1,
                `status_buy` TINYINT(1) DEFAULT 1,
                `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
                `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                UNIQUE KEY `uk_products_ref` (`ref`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

            CREATE TABLE IF NOT EXISTS `product_associations` (
                `fk_product_parent` INT NOT NULL,
                `fk_product_child` INT NOT NULL,
                `qty` DECIMAL(10,4) DEFAULT 1,
                `incdec` INT DEFAULT 1,
                PRIMARY KEY (`fk_product_parent`, `fk_product_child`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

            CREATE TABLE IF NOT EXISTS `product_supplier_prices` (
                `id` INT AUTO_INCREMENT PRIMARY KEY,
                `fk_product` INT NOT NULL,
                `fk_supplier` INT DEFAULT NULL,
                `price` DECIMAL(15,8) DEFAULT 0.00,
                `qty` DECIMAL(10,4) DEFAULT 1,
                `tva_tx` DECIMAL(5,3) DEFAULT 0.00,
                `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

            CREATE TABLE IF NOT EXISTS `product_customer_prices` (
                `id` INT AUTO_INCREMENT PRIMARY KEY,
                `fk_product` INT NOT NULL,
                `price` DECIMAL(15,8) DEFAULT 0.00,
                `price_ttc` DECIMAL(15,8) DEFAULT 0.00,
                `tva_tx` DECIMAL(5,3) DEFAULT 0.00,
                `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

            CREATE TABLE IF NOT EXISTS `product_stock` (
                `id` INT AUTO_INCREMENT PRIMARY KEY,
                `fk_product` INT NOT NULL,
                `fk_warehouse` INT DEFAULT NULL,
                `qty` DECIMAL(10,4) DEFAULT 0.00,
                `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

            CREATE TABLE IF NOT EXISTS `product_attributes` (
                `id` INT AUTO_INCREMENT PRIMARY KEY,
                `label` VARCHAR(255) NOT NULL,
                `type` VARCHAR(50) DEFAULT NULL
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

            CREATE TABLE IF NOT EXISTS `product_variants` (
                `id` INT AUTO_INCREMENT PRIMARY KEY,
                `fk_product_parent` INT NOT NULL,
                `fk_product_child` INT NOT NULL
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

            CREATE TABLE IF NOT EXISTS `product_contacts` (
                `product_id` INT NOT NULL,
                `contact_id` INT NOT NULL,
                `type` VARCHAR(50) DEFAULT NULL,
                PRIMARY KEY (`product_id`, `contact_id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
        ";
        
        $pdo->exec($sql);
    }

    public function down(\PDO $pdo): void
    {
        $tables = [
            'product_contacts',
            'product_variants',
            'product_attributes',
            'product_stock',
            'product_customer_prices',
            'product_supplier_prices',
            'product_associations',
            'products'
        ];
        
        foreach ($tables as $table) {
            $pdo->exec("DROP TABLE IF EXISTS `$table`");
        }
    }
};
