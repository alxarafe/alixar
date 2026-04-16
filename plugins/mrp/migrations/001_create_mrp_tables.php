<?php

declare(strict_types=1);

return new class extends \Core\Infrastructure\Persistence\Migration\MigrationDefinition {
    public function up(PDO $pdo): void
    {
        // Table: mrp_workstations
        $pdo->exec("
            CREATE TABLE IF NOT EXISTS mrp_workstations (
                id INT AUTO_INCREMENT PRIMARY KEY,
                ref VARCHAR(50) NOT NULL UNIQUE,
                label VARCHAR(255) NOT NULL,
                hourly_rate DECIMAL(24,8) DEFAULT 0,
                status VARCHAR(20) DEFAULT 'active',
                created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
                updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
        ");

        // Table: mrp_boms
        $pdo->exec("
            CREATE TABLE IF NOT EXISTS mrp_boms (
                id INT AUTO_INCREMENT PRIMARY KEY,
                ref VARCHAR(50) NOT NULL UNIQUE,
                label VARCHAR(255) NOT NULL,
                product_id INT NOT NULL,
                qty DECIMAL(24,8) DEFAULT 1,
                status VARCHAR(20) DEFAULT 'draft',
                created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
                updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                INDEX idx_product (product_id)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
        ");

        // Table: mrp_mos (Manufacturing Orders)
        $pdo->exec("
            CREATE TABLE IF NOT EXISTS mrp_mos (
                id INT AUTO_INCREMENT PRIMARY KEY,
                ref VARCHAR(50) NOT NULL UNIQUE,
                label VARCHAR(255) NOT NULL,
                bom_id INT NOT NULL,
                qty_to_produce DECIMAL(24,8) DEFAULT 1,
                status VARCHAR(20) DEFAULT 'draft',
                date_start DATETIME NULL,
                date_end DATETIME NULL,
                created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
                updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                CONSTRAINT fk_mo_bom FOREIGN KEY (bom_id) REFERENCES mrp_boms(id) ON DELETE RESTRICT
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
        ");
    }

    public function down(PDO $pdo): void
    {
        $pdo->exec("DROP TABLE IF EXISTS mrp_mos;");
        $pdo->exec("DROP TABLE IF EXISTS mrp_boms;");
        $pdo->exec("DROP TABLE IF EXISTS mrp_workstations;");
    }
};
