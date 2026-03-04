<?php
session_start();

require __DIR__ . '/../vendor/autoload.php';

use Alxarafe\Tools\Dispatcher\WebDispatcher;
use Alxarafe\Base\Config;

// Define base paths
define('BASE_PATH', __DIR__);
define('APP_PATH', realpath(__DIR__ . '/../'));
define('ALX_PATH', APP_PATH . '/vendor/alxarafe/alxarafe');

// Load Configuration
$config = Config::getConfig();

// Define URLs
$baseUrl = $config->main->url ?? ($_SERVER['REQUEST_SCHEME'] ?? 'http') . '://' . ($_SERVER['HTTP_HOST'] ?? 'localhost');
define('BASE_URL', rtrim($baseUrl, '/'));
define('APP_URL', BASE_URL);

// Application Branding and Theme
if ($config && isset($config->main)) {
    $config->main->appName = 'Alixar';
    $config->main->appIcon = 'fas fa-server';

    // Check for theme in session first, then cookie
    $theme = $_SESSION['alx_theme_test'] ?? $_COOKIE['alx_theme'] ?? $config->main->theme ?? 'default';

    // Force 'alixar' if 'default' is requested but 'alixar' is available
    if ($theme === 'default' && $config->main->theme === 'alixar') {
        $theme = 'alixar';
        $_COOKIE['alx_theme'] = 'alixar'; // Force for current request
        setcookie('alx_theme', 'alixar', time() + 3600, '/');
    }

    define('THEME_SKIN', $theme);
}

// Runtime Aliases and Initialization
class_alias(\Illuminate\Support\Str::class, 'Str');

// Regeneration Hook
if (isset($_GET['action']) && $_GET['action'] === 'regenerate') {
    \Alxarafe\Tools\ModuleManager::regenerate();
}

// Dispatch to Alixar Module
WebDispatcher::dispatch('Alixar', 'Dashboard', 'index');
