<?php

declare(strict_types=1);

return new class extends \Core\Infrastructure\Persistence\Migration\MigrationDefinition {
    public function up(\PDO $pdo): void
    {
        $sql = "
            CREATE TABLE IF NOT EXISTS `treasury_bank_accounts` (
                `id` INT AUTO_INCREMENT PRIMARY KEY,
                `ref` VARCHAR(255) NOT NULL,
                `label` VARCHAR(255) NOT NULL,
                `bank` VARCHAR(255) NULL,
                `bic` VARCHAR(50) NULL,
                `iban_prefix` VARCHAR(50) NULL,
                `currency_code` VARCHAR(3) NOT NULL DEFAULT 'EUR',
                `status` INT NOT NULL DEFAULT 0,
                `account_type` INT NOT NULL DEFAULT 1,
                `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                `updated_at` DATETIME NULL ON UPDATE CURRENT_TIMESTAMP,
                KEY `idx_treasury_bank_accounts_ref` (`ref`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

            CREATE TABLE IF NOT EXISTS `bank_transactions` (
                `id` INT AUTO_INCREMENT PRIMARY KEY,
                `account_id` INT NOT NULL,
                `datev` DATETIME NULL,
                `dateo` DATETIME NULL,
                `amount` DOUBLE NOT NULL DEFAULT 0,
                `label` VARCHAR(255) NOT NULL,
                `type` VARCHAR(50) NULL,
                `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
                `updated_at` DATETIME NULL ON UPDATE CURRENT_TIMESTAMP,
                KEY `idx_bank_transactions_acct` (`account_id`),
                CONSTRAINT `fk_bank_transactions_acct` FOREIGN KEY (`account_id`) REFERENCES `treasury_bank_accounts` (`id`) ON DELETE CASCADE
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
        ";
        $pdo->exec($sql);
    }

    public function down(\PDO $pdo): void
    {
        $tables = ['bank_transactions', 'treasury_bank_accounts'];
        foreach ($tables as $table) {
            $pdo->exec("DROP TABLE IF EXISTS `$table`");
        }
    }
};
