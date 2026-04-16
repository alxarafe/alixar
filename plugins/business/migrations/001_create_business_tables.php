<?php

declare(strict_types=1);

return new class extends \Core\Infrastructure\Persistence\Migration\MigrationDefinition {
    public function up(\PDO $pdo): void
    {
        $sql = "
            CREATE TABLE IF NOT EXISTS `third_parties` (
                `id` INT AUTO_INCREMENT PRIMARY KEY,
                `name` VARCHAR(255) NOT NULL,
                `name_alias` VARCHAR(255) DEFAULT NULL,
                `type` INT DEFAULT 0,
                `is_supplier` TINYINT(1) DEFAULT 0,
                `status` INT DEFAULT 1,
                `address` TEXT,
                `zip` VARCHAR(25),
                `town` VARCHAR(50),
                `country_id` INT DEFAULT NULL,
                `phone` VARCHAR(20),
                `email` VARCHAR(255),
                `url` VARCHAR(255),
                `vat_number` VARCHAR(255),
                `nif` VARCHAR(255),
                `capital` DECIMAL(15,8) DEFAULT NULL,
                `customer_code` VARCHAR(50),
                `supplier_code` VARCHAR(50),
                `note_private` TEXT,
                `note_public` TEXT,
                `entity` INT DEFAULT 1,
                `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
                UNIQUE KEY `uk_third_parties_customer_code` (`customer_code`),
                UNIQUE KEY `uk_third_parties_supplier_code` (`supplier_code`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

            CREATE TABLE IF NOT EXISTS `bank_accounts` (
                `id` INT AUTO_INCREMENT PRIMARY KEY,
                `third_party_id` INT NOT NULL,
                `bank` VARCHAR(255),
                `bank_code` VARCHAR(50),
                `desk_code` VARCHAR(50),
                `number` VARCHAR(255),
                `rib_key` VARCHAR(50),
                `bic` VARCHAR(50),
                `iban` VARCHAR(255),
                `owner_name` VARCHAR(255),
                `owner_address` TEXT,
                `label` VARCHAR(255),
                `is_default` TINYINT(1) DEFAULT 0,
                KEY `idx_bank_accounts_third_party` (`third_party_id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

            CREATE TABLE IF NOT EXISTS `third_party_categories` (
                `id` INT AUTO_INCREMENT PRIMARY KEY,
                `label` VARCHAR(255) NOT NULL,
                `description` TEXT,
                `type` INT DEFAULT 0,
                `color` VARCHAR(10)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

            CREATE TABLE IF NOT EXISTS `third_party_category_links` (
                `category_id` INT NOT NULL,
                `third_party_id` INT NOT NULL,
                PRIMARY KEY (`category_id`, `third_party_id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

            CREATE TABLE IF NOT EXISTS `third_party_representatives` (
                `id` INT AUTO_INCREMENT PRIMARY KEY,
                `third_party_id` INT NOT NULL,
                `user_id` INT NOT NULL,
                KEY `idx_representatives_tp` (`third_party_id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
        ";
        $pdo->exec($sql);
    }

    public function down(\PDO $pdo): void
    {
        $tables = [
            'third_party_representatives',
            'third_party_category_links',
            'third_party_categories',
            'bank_accounts',
            'third_parties'
        ];
        foreach ($tables as $table) {
            $pdo->exec("DROP TABLE IF EXISTS `$table`");
        }
    }
};
