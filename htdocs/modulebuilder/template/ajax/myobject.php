<?php

/* Copyright (C) 2022 Laurent Destailleur  <eldy@users.sourceforge.net>
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

/**
 *       \file       htdocs/mymodule/ajax/myobject.php
 *       \brief      File to return Ajax response on product list request
 */

if (!defined('NOTOKENRENEWAL')) {
    define('NOTOKENRENEWAL', 1); // Disables token renewal
}
defineIfNotDefined('NOREQUIREMENU', '1');
defineIfNotDefined('NOREQUIREHTML', '1');
defineIfNotDefined('NOREQUIREAJAX', '1');
defineIfNotDefined('NOREQUIRESOC', '1');
defineIfNotDefined('NOCSRFCHECK', '1');
defineIfNotDefined('NOREQUIREHTML', '1');

// Load Dolibarr environment
require BASE_PATH . '/main.inc.php';

$mode = GETPOST('mode', 'aZ09');

// Security check
restrictedArea($user, 'mymodule', 0, 'myobject');


/*
 * View
 */

dol_syslog("Call ajax mymodule/ajax/myobject.php");

top_httphead('application/json');

$arrayresult = array();

// ....

$db->close();

print json_encode($arrayresult);
