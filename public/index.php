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

/**
 * Gets the URL segment corresponding to the controller route.
 *
 * @return string
 */
function getControllerRoute(): string
{
    $full = $_SERVER['REQUEST_URI'] ?? '/index.php';
    $interrogation_position = strpos($full, '?');
    if ($interrogation_position !== false) {
        $full = substr($full, 0, $interrogation_position);
    }
    /**
     * If the URL is formed as a subdirectory, it will have to be accessed through
     * the public subdirectory.
     * In that case, the path is from the public folder, since up to public, it
     * will be part of BASE_URL.
     */
    $public_cad = '/public/';
    $public_pos = strpos($full, $public_cad);
    if ($public_pos !== false) {
        $full = substr($full, $public_pos + strlen($public_cad) - 1);
    }
    return $full;
}

/**
 * Obtains the main url
 *
 * TODO: This function is defined in Alxarafe.
 *       As soon as the Alxarafe code is brought in, it will be removed and
 *       Functions::getUrl() will be used instead.
 *
 * @return string
 */
function getUrl()
{
    $ssl = !empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == 'on';
    $proto = strtolower($_SERVER['SERVER_PROTOCOL']);
    $proto = substr($proto, 0, strpos($proto, '/')) . ($ssl ? 's' : '');
    if (isset($_SERVER['HTTP_HOST'])) {
        $host = $_SERVER['HTTP_HOST'];
    } else {
        $port = $_SERVER['SERVER_PORT'];
        $port = ((!$ssl && $port == '80') || ($ssl && $port == '443')) ? '' : ':' . $port;
        $host = $_SERVER['SERVER_NAME'] . $port;
    }

    $script = $_SERVER['SCRIPT_NAME'];

    $script = substr($script, 0, strlen($script) - strlen('/index.php'));
    return $proto . '://' . $host . $script;
}
const BASE_PATH = __DIR__;

$autoload_filename = realpath(BASE_PATH . '/../vendor/autoload.php');
if (!file_exists($autoload_filename)) {
    die('<h1>COMPOSER ERROR</h1><p>You need to run: "composer install"</p>');
}

require_once $autoload_filename;

define('BASE_URL', getUrl());

// Define Dolibarr Constants
define('DOL_DOCUMENT_ROOT', constant('BASE_PATH') . '/htdocs');
define('DOL_URL_ROOT', constant('BASE_URL') . '/htdocs');

/**
 * Here we would have to check if the variables that determine the use of a
 * modern controller have been received via GET.
 *
 * For the moment, we are taking Dolibarr style routes.
 */

$route = getControllerRoute();
if (!isset($route) || $route === '/') {
    $route = '/index.php';
}

$fullname = DOL_DOCUMENT_ROOT . $route;
$last_slash_pos = strrpos($fullname, '/');
$fullpath = $fullname;
if ($last_slash_pos !== false) {
    $fullpath = substr($fullpath, 0, $last_slash_pos);
}
$relative_path = substr($fullpath, strlen(DOL_DOCUMENT_ROOT));

if (isset($_GET['api_route'])) {
    $_SERVER['PHP_SELF'] = $route;
    require_once constant('DOL_DOCUMENT_ROOT') . '/api/index.php';
    die();
}

/**
 * Dolibarr uses the $_SERVER['PHP_SELF'] variable in much of the code to know how it
 * has been invoked. Now it doesn't work because the entry point is unique.
 * Here we put a temporary patch while it is migrating.
 */
$_SERVER['PHP_SELF'] = constant('BASE_URL') . $route;

/**
 * If a value has been defined for the GET controller variable, an attempt
 * is made to launch the controller.const CONTROLLER_VAR = 'controller';
 */
const MODULE_NAME_VAR = 'module';
const CONTROLLER_VAR = 'controller';
const METHOD_VAR = 'method';
const METHOD_DEFAULT_VALUE = 'action';

$module = filter_input(INPUT_GET, MODULE_NAME_VAR);
$controller = filter_input(INPUT_GET, CONTROLLER_VAR);
$method = filter_input(INPUT_GET, METHOD_VAR) ?? METHOD_DEFAULT_VALUE;

$routes = [
    'Dolibarr\\Code' => '/Dolibarr/Code/',
    'Module' => '/Module/',
];

if (isset($module) && isset($controller)) {
    if (Dispatcher::run($module, $controller, $method, $routes)) {
        die(); // The controller has been executed succesfully!
    }
}

chdir($fullpath);

require_once $fullname;
