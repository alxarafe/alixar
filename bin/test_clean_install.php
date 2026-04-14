#!/usr/bin/env php
<?php

declare(strict_types=1);

/**
 * Test Clean Install — Verifies the Core can bootstrap from an empty database.
 *
 * Usage (inside Docker):
 *   php bin/test_clean_install.php
 *
 * Usage (outside Docker):
 *   docker compose exec alixar_php php bin/test_clean_install.php
 *
 * What it does:
 * 1. Connects to the database configured in config/api.php
 * 2. Drops ALL existing Core tables (clean slate)
 * 3. Runs the CoreMigrationRunner
 * 4. Verifies that all expected tables were created
 * 5. Verifies seed data (admin user, roles, permissions)
 */

require_once __DIR__ . '/../vendor/autoload.php';

// ── Configuration ────────────────────────────────────────────
$config = require __DIR__ . '/../config/api.php';
$dbConfig = $config['database'] ?? [];

$host     = $dbConfig['host'] ?? '127.0.0.1';
$port     = $dbConfig['port'] ?? 3306;
$database = $dbConfig['database'] ?? 'alixar_db';
$username = $dbConfig['username'] ?? 'root';
$password = $dbConfig['password'] ?? 'root';
$charset  = $dbConfig['charset'] ?? 'utf8mb4';

echo "\n";
echo "╔══════════════════════════════════════════════════════════════╗\n";
echo "║           Alixar Core — Clean Install Test                  ║\n";
echo "╚══════════════════════════════════════════════════════════════╝\n\n";

// ── Connect ──────────────────────────────────────────────────
echo "→ Connecting to {$host}:{$port}/{$database}...\n";

try {
    $pdo = new PDO(
        sprintf('mysql:host=%s;port=%d;dbname=%s;charset=%s', $host, $port, $database, $charset),
        $username,
        $password,
        [
            PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            PDO::ATTR_EMULATE_PREPARES   => false,
        ]
    );
    echo "  ✓ Connected.\n\n";
} catch (\PDOException $e) {
    echo "  ✗ Connection failed: {$e->getMessage()}\n";
    exit(1);
}

// ── Drop existing Core tables (clean slate) ──────────────────
echo "→ Dropping existing Core tables (clean slate)...\n";

$pdo->exec('SET FOREIGN_KEY_CHECKS = 0');

$coreTables = [
    'core_migrations',
    'jwt_blacklist',
    'audit_log',
    'translations',
    'settings',
    'plugins',
    'role_permissions',
    'user_roles',
    'permissions',
    'roles',
    'users',
];

foreach ($coreTables as $table) {
    $pdo->exec("DROP TABLE IF EXISTS {$table}");
}

$pdo->exec('SET FOREIGN_KEY_CHECKS = 1');
echo "  ✓ Tables dropped.\n\n";

// ── Run migrations ───────────────────────────────────────────
echo "→ Running Core migrations...\n";

$runner = new \Core\Infrastructure\Persistence\Migration\CoreMigrationRunner($pdo);
$migrationsDir = __DIR__ . '/../src/Infrastructure/Persistence/Migration/migrations';

try {
    $ran = $runner->migrate($migrationsDir);

    if (empty($ran)) {
        echo "  ⚠ No migrations to run.\n";
    } else {
        foreach ($ran as $name) {
            echo "  ✓ {$name}\n";
        }
    }
    echo "\n";
} catch (\Throwable $e) {
    echo "  ✗ Migration failed: {$e->getMessage()}\n";
    if ($e->getPrevious()) {
        echo "    Caused by: {$e->getPrevious()->getMessage()}\n";
    }
    exit(1);
}

// ── Verify tables ────────────────────────────────────────────
echo "→ Verifying tables...\n";

$expectedTables = [
    'core_migrations',
    'users',
    'roles',
    'permissions',
    'user_roles',
    'role_permissions',
    'plugins',
    'settings',
    'translations',
    'audit_log',
    'jwt_blacklist',
];

$stmt = $pdo->query('SHOW TABLES');
$existingTables = $stmt->fetchAll(PDO::FETCH_COLUMN);

$allOk = true;
foreach ($expectedTables as $table) {
    if (in_array($table, $existingTables, true)) {
        echo "  ✓ {$table}\n";
    } else {
        echo "  ✗ {$table} — MISSING!\n";
        $allOk = false;
    }
}
echo "\n";

// ── Verify seed data ─────────────────────────────────────────
echo "→ Verifying seed data...\n";

// Admin user
$stmt = $pdo->prepare('SELECT id, username, email, is_superadmin FROM users WHERE username = :u');
$stmt->execute(['u' => 'admin']);
$admin = $stmt->fetch();

if ($admin) {
    echo "  ✓ Admin user: {$admin['username']} ({$admin['email']}), superadmin=" . ($admin['is_superadmin'] ? 'yes' : 'no') . "\n";
} else {
    echo "  ✗ Admin user NOT FOUND!\n";
    $allOk = false;
}

// Roles
$stmt = $pdo->query('SELECT name, is_system FROM roles ORDER BY id');
$roles = $stmt->fetchAll();
echo "  ✓ Roles: " . implode(', ', array_column($roles, 'name')) . "\n";

if (count($roles) < 3) {
    echo "  ✗ Expected at least 3 system roles!\n";
    $allOk = false;
}

// Permissions
$stmt = $pdo->query('SELECT COUNT(*) FROM permissions WHERE plugin = \'core\'');
$permCount = (int) $stmt->fetchColumn();
echo "  ✓ Core permissions: {$permCount}\n";

if ($permCount < 10) {
    echo "  ✗ Expected at least 10 core permissions!\n";
    $allOk = false;
}

// User-Role assignment
$stmt = $pdo->prepare('
    SELECT r.name 
    FROM user_roles ur 
    JOIN roles r ON r.id = ur.role_id 
    JOIN users u ON u.id = ur.user_id 
    WHERE u.username = :u
');
$stmt->execute(['u' => 'admin']);
$adminRoles = $stmt->fetchAll(PDO::FETCH_COLUMN);
echo "  ✓ Admin roles: " . implode(', ', $adminRoles) . "\n";

if (!in_array('superadmin', $adminRoles, true)) {
    echo "  ✗ Admin user should have 'superadmin' role!\n";
    $allOk = false;
}

// Role-Permission assignment
$stmt = $pdo->prepare('
    SELECT COUNT(*) 
    FROM role_permissions rp 
    JOIN roles r ON r.id = rp.role_id 
    WHERE r.name = :r
');
$stmt->execute(['r' => 'superadmin']);
$saPermCount = (int) $stmt->fetchColumn();
echo "  ✓ Superadmin role permissions: {$saPermCount}\n";

if ($saPermCount !== $permCount) {
    echo "  ✗ Superadmin should have ALL core permissions ({$permCount})!\n";
    $allOk = false;
}

// Migration recorded
$stmt = $pdo->query('SELECT migration FROM core_migrations');
$recorded = $stmt->fetchAll(PDO::FETCH_COLUMN);
echo "  ✓ Recorded migrations: " . implode(', ', $recorded) . "\n";

echo "\n";

// ── Verify rollback ──────────────────────────────────────────
echo "→ Testing rollback...\n";

$rolledBack = $runner->rollback($migrationsDir);
echo "  ✓ Rolled back: " . implode(', ', $rolledBack) . "\n";

// Verify tables are gone
$stmt = $pdo->query('SHOW TABLES');
$remainingTables = $stmt->fetchAll(PDO::FETCH_COLUMN);
$coreRemaining = array_intersect($expectedTables, $remainingTables);
// core_migrations should still exist (it's the runner's own table)
$coreRemaining = array_diff($coreRemaining, ['core_migrations']);

if (empty($coreRemaining)) {
    echo "  ✓ All core tables cleaned up after rollback.\n";
} else {
    echo "  ✗ Tables still present after rollback: " . implode(', ', $coreRemaining) . "\n";
    $allOk = false;
}

echo "\n";

// ── Re-run migrations (verify idempotency) ───────────────────
echo "→ Re-running migrations (verify re-apply)...\n";

$reRan = $runner->migrate($migrationsDir);
echo "  ✓ Re-applied: " . implode(', ', $reRan) . "\n\n";

// ── Final Result ─────────────────────────────────────────────
if ($allOk) {
    echo "╔══════════════════════════════════════════════════════════════╗\n";
    echo "║  ✅  ALL CHECKS PASSED — Core installs cleanly from zero   ║\n";
    echo "╚══════════════════════════════════════════════════════════════╝\n\n";
    exit(0);
} else {
    echo "╔══════════════════════════════════════════════════════════════╗\n";
    echo "║  ❌  SOME CHECKS FAILED — Review output above              ║\n";
    echo "╚══════════════════════════════════════════════════════════════╝\n\n";
    exit(1);
}
