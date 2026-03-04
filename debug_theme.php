<?php
define('APP_PATH', __DIR__);
define('BASE_PATH', __DIR__ . '/public');
require 'vendor/autoload.php';

use Alxarafe\Base\Config;
use Alxarafe\Base\Database;
use Illuminate\Database\Capsule\Manager as DB;

echo "APP_PATH: " . APP_PATH . "\n";
$config = Config::getConfig();
if (!$config) {
    die("Error: Config not loaded\n");
}

echo "Config Theme: " . ($config->main->theme ?? 'NOT SET') . "\n";

try {
    Database::createConnection($config->db);
    $users = DB::table('user')->where('admin', 1)->get(['login', 'theme']);
    foreach ($users as $user) {
        echo "User: " . $user->login . " | Theme: " . ($user->theme ?: 'NULL') . "\n";
    }
} catch (\Exception $e) {
    echo "DB Error: " . $e->getMessage() . "\n";
}
