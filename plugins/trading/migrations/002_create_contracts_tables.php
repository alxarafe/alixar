<?php

declare(strict_types=1);

return new class extends \Core\Infrastructure\Persistence\Migration\MigrationDefinition {
    public function up(\PDO $pdo): void
    {
        $sql = "
            CREATE TABLE IF NOT EXISTS `contracts` (
                `id` INT AUTO_INCREMENT PRIMARY KEY,
                `ref` VARCHAR(255) NOT NULL,
                `third_party_id` INT NOT NULL,
                `note_private` TEXT NULL,
                `note_public` TEXT NULL,
                `status` INT NOT NULL DEFAULT 0,
                `date_contract` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                `updated_at` DATETIME NULL ON UPDATE CURRENT_TIMESTAMP,
                KEY `idx_contracts_ref` (`ref`),
                KEY `idx_contracts_tp` (`third_party_id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

            CREATE TABLE IF NOT EXISTS `contract_lines` (
                `id` INT AUTO_INCREMENT PRIMARY KEY,
                `contract_id` INT NOT NULL,
                `product_id` INT NULL,
                `description` TEXT NOT NULL,
                `qty` DOUBLE NOT NULL DEFAULT 1,
                `subprice` DOUBLE NOT NULL DEFAULT 0,
                `vat_rate` DOUBLE NOT NULL DEFAULT 0,
                `date_start` DATETIME NULL,
                `date_end` DATETIME NULL,
                `status` INT NOT NULL DEFAULT 0,
                KEY `idx_contract_lines_contract` (`contract_id`),
                CONSTRAINT `fk_contract_lines_contract` FOREIGN KEY (`contract_id`) REFERENCES `contracts` (`id`) ON DELETE CASCADE
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
        ";
        $pdo->exec($sql);
    }

    public function down(\PDO $pdo): void
    {
        $pdo->exec("DROP TABLE IF EXISTS `contract_lines`");
        $pdo->exec("DROP TABLE IF EXISTS `contracts`");
    }
};
