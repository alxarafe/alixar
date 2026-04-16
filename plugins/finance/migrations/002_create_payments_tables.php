<?php

declare(strict_types=1);

return new class extends \Core\Infrastructure\Persistence\Migration\MigrationDefinition {
    public function up(\PDO $pdo): void
    {
        $sql = "
            CREATE TABLE IF NOT EXISTS `payments` (
                `id` INT AUTO_INCREMENT PRIMARY KEY,
                `ref` VARCHAR(255) NOT NULL,
                `amount` DOUBLE NOT NULL DEFAULT 0,
                `payment_type` VARCHAR(50) NOT NULL,
                `num` VARCHAR(255) NULL,
                `note` TEXT NULL,
                `invoice_id` INT NOT NULL,
                `bank_account_id` INT NULL,
                `date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                `updated_at` DATETIME NULL ON UPDATE CURRENT_TIMESTAMP,
                KEY `idx_payments_ref` (`ref`),
                KEY `idx_payments_inv` (`invoice_id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
        ";
        $pdo->exec($sql);
    }

    public function down(\PDO $pdo): void
    {
        $pdo->exec("DROP TABLE IF EXISTS `payments`");
    }
};
