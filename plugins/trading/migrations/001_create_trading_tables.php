<?php

declare(strict_types=1);

return new class extends \Core\Infrastructure\Persistence\Migration\MigrationDefinition {
    public function up(\PDO $pdo): void
    {
        $sql = "
            CREATE TABLE IF NOT EXISTS `proposals` (
                `id` INT AUTO_INCREMENT PRIMARY KEY,
                `third_party_id` INT NOT NULL,
                `ref` VARCHAR(50) NOT NULL,
                `ref_client` VARCHAR(255) DEFAULT NULL,
                `ref_ext` VARCHAR(255) DEFAULT NULL,
                `note_private` TEXT,
                `note_public` TEXT,
                `total_ht` DECIMAL(15,8) DEFAULT 0,
                `total_tva` DECIMAL(15,8) DEFAULT 0,
                `total_ttc` DECIMAL(15,8) DEFAULT 0,
                `status` INT DEFAULT 0,
                `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
                `updated_at` DATETIME DEFAULT NULL,
                KEY `idx_proposals_tp` (`third_party_id`),
                UNIQUE KEY `uk_proposals_ref` (`ref`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

            CREATE TABLE IF NOT EXISTS `proposal_lines` (
                `id` INT AUTO_INCREMENT PRIMARY KEY,
                `proposal_id` INT NOT NULL,
                `product_id` INT DEFAULT NULL,
                `description` TEXT,
                `qty` DECIMAL(15,8) NOT NULL,
                `price_ht` DECIMAL(15,8) NOT NULL,
                `tva_tx` DECIMAL(15,8) NOT NULL,
                `total_ht` DECIMAL(15,8) NOT NULL,
                `total_tva` DECIMAL(15,8) NOT NULL,
                `total_ttc` DECIMAL(15,8) NOT NULL,
                KEY `idx_proplines_prop` (`proposal_id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

            CREATE TABLE IF NOT EXISTS `proposal_contacts` (
                `id` INT AUTO_INCREMENT PRIMARY KEY,
                `proposal_id` INT NOT NULL,
                `contact_id` INT NOT NULL,
                `type` VARCHAR(50),
                KEY `idx_propcontacts_prop` (`proposal_id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

            CREATE TABLE IF NOT EXISTS `orders` (
                `id` INT AUTO_INCREMENT PRIMARY KEY,
                `third_party_id` INT NOT NULL,
                `ref` VARCHAR(50) NOT NULL,
                `ref_client` VARCHAR(255) DEFAULT NULL,
                `ref_ext` VARCHAR(255) DEFAULT NULL,
                `note_private` TEXT,
                `note_public` TEXT,
                `total_ht` DECIMAL(15,8) DEFAULT 0,
                `total_tva` DECIMAL(15,8) DEFAULT 0,
                `total_ttc` DECIMAL(15,8) DEFAULT 0,
                `status` INT DEFAULT 0,
                `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
                `updated_at` DATETIME DEFAULT NULL,
                KEY `idx_orders_tp` (`third_party_id`),
                UNIQUE KEY `uk_orders_ref` (`ref`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

            CREATE TABLE IF NOT EXISTS `order_lines` (
                `id` INT AUTO_INCREMENT PRIMARY KEY,
                `order_id` INT NOT NULL,
                `product_id` INT DEFAULT NULL,
                `description` TEXT,
                `qty` DECIMAL(15,8) NOT NULL,
                `price_ht` DECIMAL(15,8) NOT NULL,
                `tva_tx` DECIMAL(15,8) NOT NULL,
                `total_ht` DECIMAL(15,8) NOT NULL,
                `total_tva` DECIMAL(15,8) NOT NULL,
                `total_ttc` DECIMAL(15,8) NOT NULL,
                KEY `idx_orderlines_ord` (`order_id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

            CREATE TABLE IF NOT EXISTS `order_contacts` (
                `id` INT AUTO_INCREMENT PRIMARY KEY,
                `order_id` INT NOT NULL,
                `contact_id` INT NOT NULL,
                `type` VARCHAR(50),
                KEY `idx_ordercontacts_ord` (`order_id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

            CREATE TABLE IF NOT EXISTS `invoices` (
                `id` INT AUTO_INCREMENT PRIMARY KEY,
                `third_party_id` INT NOT NULL,
                `ref` VARCHAR(50) NOT NULL,
                `ref_client` VARCHAR(255) DEFAULT NULL,
                `ref_ext` VARCHAR(255) DEFAULT NULL,
                `note_private` TEXT,
                `note_public` TEXT,
                `total_ht` DECIMAL(15,8) DEFAULT 0,
                `total_tva` DECIMAL(15,8) DEFAULT 0,
                `total_ttc` DECIMAL(15,8) DEFAULT 0,
                `status` INT DEFAULT 0,
                `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
                `updated_at` DATETIME DEFAULT NULL,
                KEY `idx_invoices_tp` (`third_party_id`),
                UNIQUE KEY `uk_invoices_ref` (`ref`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

            CREATE TABLE IF NOT EXISTS `invoice_lines` (
                `id` INT AUTO_INCREMENT PRIMARY KEY,
                `invoice_id` INT NOT NULL,
                `product_id` INT DEFAULT NULL,
                `description` TEXT,
                `qty` DECIMAL(15,8) NOT NULL,
                `price_ht` DECIMAL(15,8) NOT NULL,
                `tva_tx` DECIMAL(15,8) NOT NULL,
                `total_ht` DECIMAL(15,8) NOT NULL,
                `total_tva` DECIMAL(15,8) NOT NULL,
                `total_ttc` DECIMAL(15,8) NOT NULL,
                KEY `idx_invoicelines_inv` (`invoice_id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

            CREATE TABLE IF NOT EXISTS `invoice_contacts` (
                `id` INT AUTO_INCREMENT PRIMARY KEY,
                `invoice_id` INT NOT NULL,
                `contact_id` INT NOT NULL,
                `type` VARCHAR(50),
                KEY `idx_invcontacts_inv` (`invoice_id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

            CREATE TABLE IF NOT EXISTS `supplier_invoices` (
                `id` INT AUTO_INCREMENT PRIMARY KEY,
                `third_party_id` INT NOT NULL,
                `ref` VARCHAR(50) NOT NULL,
                `ref_supplier` VARCHAR(255) DEFAULT NULL,
                `ref_ext` VARCHAR(255) DEFAULT NULL,
                `note_private` TEXT,
                `note_public` TEXT,
                `total_ht` DECIMAL(15,8) DEFAULT 0,
                `total_tva` DECIMAL(15,8) DEFAULT 0,
                `total_ttc` DECIMAL(15,8) DEFAULT 0,
                `status` INT DEFAULT 0,
                `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
                `updated_at` DATETIME DEFAULT NULL,
                KEY `idx_supinv_tp` (`third_party_id`),
                UNIQUE KEY `uk_supinv_ref` (`ref`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

            CREATE TABLE IF NOT EXISTS `supplier_invoice_lines` (
                `id` INT AUTO_INCREMENT PRIMARY KEY,
                `supplier_invoice_id` INT NOT NULL,
                `product_id` INT DEFAULT NULL,
                `description` TEXT,
                `qty` DECIMAL(15,8) NOT NULL,
                `price_ht` DECIMAL(15,8) NOT NULL,
                `tva_tx` DECIMAL(15,8) NOT NULL,
                `total_ht` DECIMAL(15,8) NOT NULL,
                `total_tva` DECIMAL(15,8) NOT NULL,
                `total_ttc` DECIMAL(15,8) NOT NULL,
                KEY `idx_supinvlines_inv` (`supplier_invoice_id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

            CREATE TABLE IF NOT EXISTS `supplier_orders` (
                `id` INT AUTO_INCREMENT PRIMARY KEY,
                `third_party_id` INT NOT NULL,
                `ref` VARCHAR(50) NOT NULL,
                `ref_supplier` VARCHAR(255) DEFAULT NULL,
                `ref_ext` VARCHAR(255) DEFAULT NULL,
                `note_private` TEXT,
                `note_public` TEXT,
                `total_ht` DECIMAL(15,8) DEFAULT 0,
                `total_tva` DECIMAL(15,8) DEFAULT 0,
                `total_ttc` DECIMAL(15,8) DEFAULT 0,
                `status` INT DEFAULT 0,
                `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
                `updated_at` DATETIME DEFAULT NULL,
                KEY `idx_supord_tp` (`third_party_id`),
                UNIQUE KEY `uk_supord_ref` (`ref`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

            CREATE TABLE IF NOT EXISTS `supplier_order_lines` (
                `id` INT AUTO_INCREMENT PRIMARY KEY,
                `supplier_order_id` INT NOT NULL,
                `product_id` INT DEFAULT NULL,
                `description` TEXT,
                `qty` DECIMAL(15,8) NOT NULL,
                `price_ht` DECIMAL(15,8) NOT NULL,
                `tva_tx` DECIMAL(15,8) NOT NULL,
                `total_ht` DECIMAL(15,8) NOT NULL,
                `total_tva` DECIMAL(15,8) NOT NULL,
                `total_ttc` DECIMAL(15,8) NOT NULL,
                KEY `idx_supordlines_ord` (`supplier_order_id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
        ";
        $pdo->exec($sql);
    }

    public function down(\PDO $pdo): void
    {
        $tables = [
            'supplier_order_lines', 'supplier_orders',
            'supplier_invoice_lines', 'supplier_invoices',
            'invoice_contacts', 'invoice_lines', 'invoices',
            'order_contacts', 'order_lines', 'orders',
            'proposal_contacts', 'proposal_lines', 'proposals'
        ];
        foreach ($tables as $table) {
            $pdo->exec("DROP TABLE IF EXISTS `$table`");
        }
    }
};
