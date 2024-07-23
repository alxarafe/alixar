<?php

/**
 * Copyright (C) 2024       Rafael San José         <rsanjose@alxarafe.com>
 * Copyright (C) 2024       Rafael San José             <rsanjose@alxarafe.com>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <https://www.gnu.org/licenses/>.
 */

use Alxarafe\Lib\Dispatcher;
use Alxarafe\Lib\Functions;

const BASE_PATH = __DIR__;

$autoload_filename = realpath(BASE_PATH . '/../vendor/autoload.php');
if (!file_exists($autoload_filename)) {
    die('<h1>COMPOSER ERROR</h1><p>You need to run: "composer install"</p>');
}

require_once $autoload_filename;

define('BASE_URL', Functions::getUrl());

// Define Dolibarr Constants
define('DOL_DOCUMENT_ROOT', constant('BASE_PATH') . '/htdocs');
define('DOL_URL_ROOT', constant('BASE_URL') . '/htdocs');

$path = $_GET['url_route'] ?? '';
$file = $_GET['url_filename'] ?? 'index';
$api = $_GET['api_route'] ?? '';
if (!empty($path)) {
    $path .= '/';
}

/**
 * Dolibarr uses the $_SERVER['PHP_SELF'] variable in much of the code to know how it
 * has been invoked. Now it doesn't work because the entry point is unique.
 * Here we put a temporary patch while it is migrating.
 */
$_SERVER['PHP_SELF'] = DIRECTORY_SEPARATOR . $path . DIRECTORY_SEPARATOR . $file . '.php';
if (!empty($api)) {
    $_SERVER['PHP_SELF'] = DIRECTORY_SEPARATOR . $path . DIRECTORY_SEPARATOR . $file . '.php' . DIRECTORY_SEPARATOR . $api;
}

$filename = BASE_PATH . '/htdocs/' . $path . $file . '.php';

// Loads Dolibarr codefile
require_once $filename;
