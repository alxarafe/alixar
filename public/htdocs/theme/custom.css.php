<?php

/**
 * custom.css.php
 *
 * Copyright (c) 2023       Eric Seigne                 <eric.seigne@cap-rel.fr>
 * Copyright (C) 2024       Rafael San José             <rsanjose@alxarafe.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as
 * published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

use Alxarafe\Lib\Functions;
use Dolibarr\Lib\ViewCss;

Functions::defineIfNotDefined('NOREQUIRESOC', 1);   // No company needed
//if (! defined('NOREQUIRETRAN')) define('NOREQUIRETRAN','1');  // Not disabled because need to do translations
Functions::defineIfNotDefined('NOCSRFCHECK', 1);  // Do not check anti CSRF attack test
Functions::defineIfNotDefined('NOTOKENRENEWAL', 1);  // Disables token renewal
if (!defined('NOLOGIN')) {
    define('NOLOGIN', 1); // File must be accessed by logon page so without login.
}
Functions::defineIfNotDefined('NOREQUIREHTML', 1); // If we don't need to load the html.form.class.php
Functions::defineIfNotDefined('NOREQUIREAJAX', 1); // Do not load ajax.lib.php library

session_cache_limiter('public');

require_once constant('DOL_DOCUMENT_ROOT') . '/main.inc.php'; // __DIR__ allow this script to be included in custom themes
require_once constant('DOL_DOCUMENT_ROOT') . '/core/lib/functions2.lib.php';

// Define css type
ViewCss::topHttpHead();

// Important: Following code is to avoid page request by browser and PHP CPU at each Dolibarr page access.
if (empty($dolibarr_nocache)) {
    header('Cache-Control: max-age=10800, public, must-revalidate');
} else {
    header('Cache-Control: no-cache');
}


print '/* Here, the content of the common custom CSS defined into Home - Setup - Display - CSS' . "*/\n";
print getDolGlobalString('MAIN_IHM_CUSTOM_CSS');
