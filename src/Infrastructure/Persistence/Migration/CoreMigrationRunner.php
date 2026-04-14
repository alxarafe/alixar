<?php

declare(strict_types=1);

namespace Core\Infrastructure\Persistence\Migration;

/**
 * Lightweight migration engine based on raw PDO.
 *
 * Responsibilities:
 * - Creates the `core_migrations` registry table if missing.
 * - Discovers migration files (PHP classes returning up/down callables).
 * - Executes pending migrations in timestamp order.
 * - Records executed migrations to prevent re-runs.
 *
 * This engine is intentionally decoupled from Eloquent or any ORM.
 * It uses plain PDO so the Core can bootstrap from a completely empty database.
 */
final class CoreMigrationRunner
{
    private const MIGRATIONS_TABLE = 'core_migrations';

    public function __construct(
        private readonly \PDO $pdo,
    ) {
    }

    /**
     * Run all pending migrations from a directory.
     *
     * Each migration file must return a MigrationDefinition with up() and down() methods.
     *
     * @param string $migrationsDir Absolute path to the directory containing migration files
     * @return string[] List of migration names that were executed
     */
    public function migrate(string $migrationsDir): array
    {
        $this->ensureMigrationsTable();

        $executed = $this->getExecutedMigrations();
        $files = $this->discoverMigrations($migrationsDir);
        $pending = array_diff_key($files, array_flip($executed));

        if (empty($pending)) {
            return [];
        }

        // Sort by filename (timestamp prefix ensures correct order)
        ksort($pending);

        $ran = [];

        foreach ($pending as $name => $filePath) {
            $this->runMigration($name, $filePath, 'up');
            $ran[] = $name;
        }

        return $ran;
    }

    /**
     * Rollback the last batch of migrations, or a specific number.
     *
     * @param string $migrationsDir Absolute path to migrations directory
     * @param int    $steps         Number of migrations to rollback (0 = all)
     * @return string[] List of migration names that were rolled back
     */
    public function rollback(string $migrationsDir, int $steps = 1): array
    {
        $this->ensureMigrationsTable();

        $executed = $this->getExecutedMigrations();

        if (empty($executed)) {
            return [];
        }

        // Reverse order for rollback
        $toRollback = $steps > 0
            ? array_slice(array_reverse($executed), 0, $steps)
            : array_reverse($executed);

        $files = $this->discoverMigrations($migrationsDir);
        $rolledBack = [];

        foreach ($toRollback as $name) {
            if (!isset($files[$name])) {
                continue; // Migration file no longer exists
            }

            $this->runMigration($name, $files[$name], 'down');
            $this->removeMigrationRecord($name);
            $rolledBack[] = $name;
        }

        return $rolledBack;
    }

    /**
     * Get list of pending migration names.
     *
     * @param string $migrationsDir Absolute path to migrations directory
     * @return string[] Migration names that haven't been executed yet
     */
    public function getPending(string $migrationsDir): array
    {
        $this->ensureMigrationsTable();

        $executed = $this->getExecutedMigrations();
        $files = $this->discoverMigrations($migrationsDir);

        return array_keys(array_diff_key($files, array_flip($executed)));
    }

    /**
     * Get list of already executed migration names.
     *
     * @return string[]
     */
    public function getExecutedMigrations(): array
    {
        $stmt = $this->pdo->query(
            'SELECT migration FROM ' . self::MIGRATIONS_TABLE . ' ORDER BY executed_at ASC'
        );

        return $stmt->fetchAll(\PDO::FETCH_COLUMN) ?: [];
    }

    /**
     * Ensure the migrations tracking table exists.
     */
    private function ensureMigrationsTable(): void
    {
        $this->pdo->exec(
            'CREATE TABLE IF NOT EXISTS ' . self::MIGRATIONS_TABLE . ' (
                id          BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
                migration   VARCHAR(255) NOT NULL UNIQUE,
                executed_at DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci'
        );
    }

    /**
     * Discover migration files in a directory.
     *
     * Files must be named like: 20260413_000001_description.php
     *
     * @param string $dir Absolute path
     * @return array<string, string> Map of [migration_name => file_path]
     */
    private function discoverMigrations(string $dir): array
    {
        if (!is_dir($dir)) {
            return [];
        }

        $files = glob($dir . '/*.php');
        if ($files === false) {
            return [];
        }

        $migrations = [];
        foreach ($files as $file) {
            $name = basename($file, '.php');
            $migrations[$name] = $file;
        }

        ksort($migrations);

        return $migrations;
    }

    /**
     * Execute a single migration file.
     *
     * Note: MySQL DDL statements (CREATE TABLE, DROP TABLE, ALTER TABLE) cause
     * implicit commits, so we cannot wrap them in PDO transactions. Instead, we
     * execute directly and only record success after completion.
     *
     * @param string $name     Migration name (filename without .php)
     * @param string $filePath Absolute path to the migration file
     * @param string $direction 'up' or 'down'
     */
    private function runMigration(string $name, string $filePath, string $direction): void
    {
        $migration = require $filePath;

        if (!$migration instanceof MigrationDefinition) {
            throw new \RuntimeException(
                "Migration '{$name}' must return an instance of MigrationDefinition."
            );
        }

        try {
            if ($direction === 'up') {
                $migration->up($this->pdo);
                $this->recordMigration($name);
            } else {
                $migration->down($this->pdo);
            }
        } catch (\Throwable $e) {
            throw new \RuntimeException(
                "Migration '{$name}' ({$direction}) failed: {$e->getMessage()}",
                0,
                $e
            );
        }
    }

    /**
     * Record a migration as executed.
     */
    private function recordMigration(string $name): void
    {
        $stmt = $this->pdo->prepare(
            'INSERT INTO ' . self::MIGRATIONS_TABLE . ' (migration) VALUES (:name)'
        );
        $stmt->execute(['name' => $name]);
    }

    /**
     * Remove a migration record (for rollback).
     */
    private function removeMigrationRecord(string $name): void
    {
        $stmt = $this->pdo->prepare(
            'DELETE FROM ' . self::MIGRATIONS_TABLE . ' WHERE migration = :name'
        );
        $stmt->execute(['name' => $name]);
    }
}
