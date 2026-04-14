<?php
require_once __DIR__ . '/vendor/autoload.php';
$config = require __DIR__ . '/config/api.php';
$dbConfig = $config['database'] ?? [];
$pdo = new PDO(
    sprintf('mysql:host=%s;port=%d;dbname=%s;charset=%s', 
        $dbConfig['host'] ?? '127.0.0.1', 
        $dbConfig['port'] ?? 3306, 
        $dbConfig['database'] ?? 'alixar_db', 
        $dbConfig['charset'] ?? 'utf8mb4'
    ),
    $dbConfig['username'] ?? 'root',
    $dbConfig['password'] ?? 'root',
    [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
);
$runner = new \Core\Infrastructure\Persistence\Migration\CoreMigrationRunner($pdo);
$ranCore = $runner->migrate(__DIR__ . '/src/Infrastructure/Persistence/Migration/migrations');
$ranHr = $runner->migrate(__DIR__ . '/plugins/hr/migrations');
$ranLogistics = $runner->migrate(__DIR__ . '/plugins/logistics/migrations');
$ranInterventions = $runner->migrate(__DIR__ . '/plugins/interventions/migrations');
$ranProducts = $runner->migrate(__DIR__ . '/plugins/products/migrations');
$ranBusiness = $runner->migrate(__DIR__ . '/plugins/business/migrations');
$ranTrading = $runner->migrate(__DIR__ . '/plugins/trading/migrations');
$ranCrm = $runner->migrate(__DIR__ . '/plugins/crm/migrations');
$ranProjects = $runner->migrate(__DIR__ . '/plugins/projects/migrations');
$ranFinance = $runner->migrate(__DIR__ . '/plugins/finance/migrations');
echo "Ran migrations: " . implode(', ', array_merge($ranCore, $ranHr, $ranLogistics, $ranInterventions, $ranProducts, $ranBusiness, $ranTrading, $ranCrm, $ranProjects, $ranFinance)) . "\n";
