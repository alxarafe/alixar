<?php

declare(strict_types=1);

return new class extends \Core\Infrastructure\Persistence\Migration\MigrationDefinition {
    public function up(PDO $pdo): void
    {
        // Table: supplier_proposals
        $pdo->exec("
            CREATE TABLE IF NOT EXISTS supplier_proposals (
                id INT AUTO_INCREMENT PRIMARY KEY,
                ref VARCHAR(50) NOT NULL UNIQUE,
                third_party_id INT NOT NULL,
                date_proposal DATETIME NOT NULL,
                date_validity DATETIME NULL,
                status VARCHAR(20) DEFAULT 'draft',
                note_public TEXT NULL,
                note_private TEXT NULL,
                total_ht DECIMAL(24,8) DEFAULT 0,
                total_vat DECIMAL(24,8) DEFAULT 0,
                total_ttc DECIMAL(24,8) DEFAULT 0,
                created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
                updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                INDEX idx_thirdparty (third_party_id)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
        ");

        // Table: supplier_proposal_lines
        $pdo->exec("
            CREATE TABLE IF NOT EXISTS supplier_proposal_lines (
                id INT AUTO_INCREMENT PRIMARY KEY,
                proposal_id INT NOT NULL,
                product_id INT NULL,
                description TEXT NOT NULL,
                qty DECIMAL(16,8) NOT NULL,
                subprice DECIMAL(24,8) NOT NULL,
                vat_rate DECIMAL(6,3) NOT NULL,
                total_ht DECIMAL(24,8) NOT NULL,
                total_vat DECIMAL(24,8) NOT NULL,
                total_ttc DECIMAL(24,8) NOT NULL,
                CONSTRAINT fk_sp_proposal FOREIGN KEY (proposal_id) REFERENCES supplier_proposals(id) ON DELETE CASCADE,
                INDEX idx_product (product_id)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
        ");
    }

    public function down(PDO $pdo): void
    {
        $pdo->exec("DROP TABLE IF EXISTS supplier_proposal_lines;");
        $pdo->exec("DROP TABLE IF EXISTS supplier_proposals;");
    }
};
