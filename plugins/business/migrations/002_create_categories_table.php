<?php

declare(strict_types=1);

return new class extends \Core\Infrastructure\Persistence\Migration\MigrationDefinition {
    public function up(\PDO $pdo): void
    {
        $sql = "
            CREATE TABLE IF NOT EXISTS `categories` (
                `id` INT AUTO_INCREMENT PRIMARY KEY,
                `label` VARCHAR(255) NOT NULL,
                `description` TEXT NULL,
                `color` VARCHAR(20) NULL,
                `position` INT NOT NULL DEFAULT 0,
                `type` INT NOT NULL DEFAULT 0,
                `parent_id` INT NULL,
                `visible` TINYINT NOT NULL DEFAULT 1,
                `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                `updated_at` DATETIME NULL ON UPDATE CURRENT_TIMESTAMP,
                KEY `idx_categories_type` (`type`),
                CONSTRAINT `fk_category_parent` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

            CREATE TABLE IF NOT EXISTS `category_product` (
                `category_id` INT NOT NULL,
                `fk_object` INT NOT NULL,
                PRIMARY KEY (`category_id`, `fk_object`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

            CREATE TABLE IF NOT EXISTS `category_customer` (
                `category_id` INT NOT NULL,
                `fk_object` INT NOT NULL,
                PRIMARY KEY (`category_id`, `fk_object`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

            CREATE TABLE IF NOT EXISTS `category_supplier` (
                `category_id` INT NOT NULL,
                `fk_object` INT NOT NULL,
                PRIMARY KEY (`category_id`, `fk_object`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

            CREATE TABLE IF NOT EXISTS `category_contact` (
                `category_id` INT NOT NULL,
                `fk_object` INT NOT NULL,
                PRIMARY KEY (`category_id`, `fk_object`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
            
            CREATE TABLE IF NOT EXISTS `category_project` (
                `category_id` INT NOT NULL,
                `fk_object` INT NOT NULL,
                PRIMARY KEY (`category_id`, `fk_object`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
        ";
        $pdo->exec($sql);
    }

    public function down(\PDO $pdo): void
    {
        $tables = [
            'category_product', 'category_customer', 'category_supplier', 
            'category_contact', 'category_project', 'categories'
        ];
        foreach ($tables as $t) {
            $pdo->exec("DROP TABLE IF EXISTS `$t`");
        }
    }
};
