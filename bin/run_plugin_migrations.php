<?php

require_once __DIR__ . '/../vendor/autoload.php';

$config = require __DIR__ . '/../config/api.php';
$dbConfig = $config['database'] ?? [];

$host     = $dbConfig['host'] ?? '127.0.0.1';
$port     = $dbConfig['port'] ?? 3306;
$database = $dbConfig['database'] ?? 'alixar_db';
$username = $dbConfig['username'] ?? 'root';
$password = $dbConfig['password'] ?? 'root';
$charset  = $dbConfig['charset'] ?? 'utf8mb4';

try {
    $pdo = new PDO(
        sprintf('mysql:host=%s;port=%d;dbname=%s;charset=%s', $host, $port, $database, $charset),
        $username,
        $password,
        [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
    );

    $migrations = [
        __DIR__ . '/../plugins/finance/migrations/002_create_payments_tables.php',
        __DIR__ . '/../plugins/business/migrations/002_create_categories_table.php',
        __DIR__ . '/../plugins/trading/migrations/002_create_contracts_tables.php',
        __DIR__ . '/../plugins/logistics/migrations/003_create_warehouse_tables.php',
        __DIR__ . '/../plugins/projects/migrations/002_create_tasks_tables.php',
        __DIR__ . '/../src/Infrastructure/Persistence/Migration/migrations/002_create_attachments_table.php',
        __DIR__ . '/../plugins/trading/migrations/003_create_supplier_proposals_tables.php',
        __DIR__ . '/../plugins/crm/migrations/002_create_tickets_table.php',
        __DIR__ . '/../plugins/finance/migrations/003_create_accountancy_tables.php',
        __DIR__ . '/../plugins/products/migrations/002_create_product_lots_table.php',
        __DIR__ . '/../plugins/hr/migrations/001_create_expense_reports_table.php',
        __DIR__ . '/../plugins/hr/migrations/002_create_extra_hr_tables.php',
        __DIR__ . '/../plugins/interventions/migrations/001_create_interventions_table.php',
        __DIR__ . '/../plugins/logistics/migrations/001_create_shipments_table.php',
        __DIR__ . '/../plugins/logistics/migrations/002_create_receptions_table.php',
        __DIR__ . '/../plugins/projects/migrations/001_create_projects_tables.php',
        __DIR__ . '/../plugins/members/migrations/001_create_members_tables.php',
        __DIR__ . '/../plugins/mrp/migrations/001_create_mrp_tables.php',
        __DIR__ . '/../plugins/finance/migrations/004_create_special_finance_tables.php',
        __DIR__ . '/../src/Infrastructure/Persistence/Migration/migrations/003_create_core_system_tables.php',
    ];

    foreach ($migrations as $file) {
        if (!file_exists($file)) {
            echo "Skipping {$file} (Not found)\n";
            continue;
        }
        echo "Running {$file}...\n";
        $mig = require $file;
        $mig->up($pdo);
        echo "OK\n";
    }
    
    echo "Done.\n";
} catch (\Exception $e) {
    echo "Error: " . $e->getMessage() . "\n";
}
