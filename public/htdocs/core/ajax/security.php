<?php

/* Copyright (C) 2011-2015 Regis Houssin  <regis.houssin@inodbox.com>
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

use Alxarafe\Lib\Functions;
use Dolibarr\Lib\ViewMain;

/**
 *       \file       htdocs/core/ajax/security.php
 *       \brief      This ajax component is used to generated hash keys for security purposes,
 *                   like the key to use into URL to protect them.
 */

Functions::defineIfNotDefined('NOTOKENRENEWAL', 1);  // Disables token renewal
Functions::defineIfNotDefined('NOREQUIREMENU', 1);  // If there is no need to load and show top and left menu
Functions::defineIfNotDefined('NOREQUIREHTML', 1); // If we don't need to load the html.form.class.php
Functions::defineIfNotDefined('NOREQUIREAJAX', 1); // Do not load ajax.lib.php library
Functions::defineIfNotDefined('NOREQUIRESOC', 1);   // No company needed
// We need langs because the getRandomPassword may use the user language to define some rules of pass generation
/*if (!defined('NOREQUIRETRAN')) {
    define('NOREQUIRETRAN', '1');
}*/

// Load Dolibarr environment
require constant('DOL_DOCUMENT_ROOT') . '/main.inc.php';

$action = GETPOST('action');

// Security check
// None. This is public component with no access and effect on data.


/*
 * View
 */

//ViewMain::topHtmlHead("", "", 1);  // Replaced with top_httphead. An ajax page does not need html header.
ViewMain::topHttpHead();

//print '<!-- Ajax page called with url '.dol_escape_htmltag($_SERVER["PHP_SELF"]).'?'.dol_escape_htmltag($_SERVER["QUERY_STRING"]).' -->'."\n";

// Return a new generated password
if ($action) {
    if ($action == 'getrandompassword') {
        require_once constant('DOL_DOCUMENT_ROOT') . '/core/lib/security2.lib.php';
        $generic = GETPOST('generic') ? true : false;
        echo getRandomPassword($generic);
    }
} else {
    if (GETPOST('errorcode') == 'InvalidToken') {
        http_response_code(401);
    }
}
