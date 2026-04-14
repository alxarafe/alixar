<?php

declare(strict_types=1);

return new class extends \Core\Infrastructure\Persistence\Migration\MigrationDefinition {
    public function up(\PDO $pdo): void
    {
        $sql = "
            CREATE TABLE IF NOT EXISTS `contacts` (
                `id` INT AUTO_INCREMENT PRIMARY KEY,
                `lastname` VARCHAR(255) NOT NULL,
                `firstname` VARCHAR(255) DEFAULT NULL,
                `civility` VARCHAR(50) DEFAULT NULL,
                `third_party_id` INT DEFAULT NULL,
                `address` TEXT,
                `zip` VARCHAR(25),
                `town` VARCHAR(255),
                `country_id` INT DEFAULT NULL,
                `phone` VARCHAR(20) DEFAULT NULL,
                `phone_perso` VARCHAR(20) DEFAULT NULL,
                `phone_mobile` VARCHAR(20) DEFAULT NULL,
                `fax` VARCHAR(20) DEFAULT NULL,
                `email` VARCHAR(255) DEFAULT NULL,
                `url` VARCHAR(255) DEFAULT NULL,
                `job_title` VARCHAR(255) DEFAULT NULL,
                `note_private` TEXT,
                `note_public` TEXT,
                `is_private` TINYINT(1) DEFAULT 0,
                `entity` INT DEFAULT 1,
                `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
                KEY `idx_contacts_tp` (`third_party_id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

            CREATE TABLE IF NOT EXISTS `events` (
                `id` INT AUTO_INCREMENT PRIMARY KEY,
                `ref` VARCHAR(50) NOT NULL,
                `title` VARCHAR(255) NOT NULL,
                `type_code` VARCHAR(50) DEFAULT 'AC_OTH',
                `date_start` DATETIME DEFAULT NULL,
                `date_end` DATETIME DEFAULT NULL,
                `percentage` INT DEFAULT 0,
                `note` TEXT,
                `third_party_id` INT DEFAULT NULL,
                `contact_id` INT DEFAULT NULL,
                `project_id` INT DEFAULT NULL,
                `assigned_user_id` INT DEFAULT NULL,
                `author_user_id` INT DEFAULT NULL,
                `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
                `updated_at` DATETIME DEFAULT NULL,
                KEY `idx_events_tp` (`third_party_id`),
                KEY `idx_events_user` (`assigned_user_id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
            CREATE TABLE IF NOT EXISTS `contact_category_links` (
                `contact_id` INT NOT NULL,
                `category_id` INT NOT NULL,
                PRIMARY KEY (`contact_id`, `category_id`)
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
        ";
        $pdo->exec($sql);
    }

    public function down(\PDO $pdo): void
    {
        $tables = ['events', 'contact_category_links', 'contacts'];
        foreach ($tables as $table) {
            $pdo->exec("DROP TABLE IF EXISTS `$table`");
        }
    }
};
