<?php

declare(strict_types=1);

namespace Core\Infrastructure\Persistence\Migration;

/**
 * Contract for a single migration.
 *
 * Each migration file returns an instance of this class (or an anonymous subclass)
 * that provides the PDO-based up() and down() logic.
 *
 * Example migration file:
 *
 *     return new class extends MigrationDefinition {
 *         public function up(\PDO $pdo): void { ... }
 *         public function down(\PDO $pdo): void { ... }
 *     };
 */
abstract class MigrationDefinition
{
    /**
     * Apply the migration (create tables, add columns, etc.).
     */
    abstract public function up(\PDO $pdo): void;

    /**
     * Reverse the migration (drop tables, remove columns, etc.).
     */
    abstract public function down(\PDO $pdo): void;
}
