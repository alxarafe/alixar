<?php

require __DIR__ . '/../vendor/autoload.php';

use Alxarafe\Tools\Dispatcher\WebDispatcher;
use Alxarafe\Base\Config;

// Define base paths
define('BASE_PATH', __DIR__);
define('APP_PATH', realpath(__DIR__ . '/../'));
define('ALX_PATH', APP_PATH . '/vendor/alxarafe/alxarafe');

// Load Configuration
$config = Config::getConfig();

// Application Branding
if ($config && isset($config->main)) {
    $config->main->appName = 'Alixar';
    $config->main->appIcon = 'fas fa-server';
}

// Runtime Aliases and Initialization
class_alias(\Illuminate\Support\Str::class, 'Str');

// Dispatch to Alixar Module
WebDispatcher::dispatch('Alixar', 'Dashboard', 'index');
