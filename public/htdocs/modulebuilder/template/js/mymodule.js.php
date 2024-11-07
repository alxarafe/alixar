<?php

/* Copyright (C) ---Put here your own copyright and developer email---
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 *
 * Library javascript to enable Browser notifications
 */

use Alxarafe\Lib\Functions;

Functions::defineIfNotDefined('NOREQUIREUSER', 1);   // No user needed
Functions::defineIfNotDefined('NOREQUIREDB', 1);   // No database needed
Functions::defineIfNotDefined('NOREQUIRESOC', 1);   // No company needed
Functions::defineIfNotDefined('NOREQUIRETRAN', 1);   // No translations needed
Functions::defineIfNotDefined('NOCSRFCHECK', 1);  // Do not check anti CSRF attack test
Functions::defineIfNotDefined('NOTOKENRENEWAL', 1);  // Disables token renewal
Functions::defineIfNotDefined('NOLOGIN', 1);  // No login needed
Functions::defineIfNotDefined('NOREQUIREMENU', 1);  // If there is no need to load and show top and left menu
Functions::defineIfNotDefined('NOREQUIREHTML', 1); // If we don't need to load the html.form.class.php
Functions::defineIfNotDefined('NOREQUIREAJAX', 1); // Do not load ajax.lib.php library

/**
 * \file    htdocs/modulebuilder/template/js/mymodule.js.php
 * \ingroup mymodule
 * \brief   JavaScript file for module MyModule.
 */

// Load Dolibarr environment
require constant('DOL_DOCUMENT_ROOT') . '/main.inc.php';

// Define js type
header('Content-Type: application/javascript');
// Important: Following code is to cache this file to avoid page request by browser at each Dolibarr page access.
// You can use CTRL+F5 to refresh your browser cache.
if (empty($dolibarr_nocache)) {
	header('Cache-Control: max-age=3600, public, must-revalidate');
} else {
	header('Cache-Control: no-cache');
}
?>

/* Javascript library of module MyModule */


