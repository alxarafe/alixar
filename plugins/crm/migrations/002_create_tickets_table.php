<?php

declare(strict_types=1);

return new class extends \Core\Infrastructure\Persistence\Migration\MigrationDefinition {
    public function up(PDO $pdo): void
    {
        $pdo->exec("
            CREATE TABLE IF NOT EXISTS tickets (
                id INT AUTO_INCREMENT PRIMARY KEY,
                ref VARCHAR(50) NOT NULL UNIQUE,
                track_id VARCHAR(50) NOT NULL UNIQUE,
                third_party_id INT NULL,
                contact_id INT NULL,
                subject VARCHAR(255) NOT NULL,
                description TEXT NOT NULL,
                type VARCHAR(20) DEFAULT 'question',
                severity VARCHAR(20) DEFAULT 'medium',
                status VARCHAR(20) DEFAULT 'open',
                date_opened DATETIME NULL,
                date_closed DATETIME NULL,
                created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
                updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                INDEX idx_thirdparty (third_party_id),
                INDEX idx_contact (contact_id),
                INDEX idx_status (status)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
        ");
    }

    public function down(PDO $pdo): void
    {
        $pdo->exec("DROP TABLE IF EXISTS tickets;");
    }
};
