<?php

/* Copyright (C) 2022 Laurent Destailleur  <eldy@users.sourceforge.net>
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
 *       \file       htdocs/mymodule/ajax/myobject.php
 *       \brief      File to return Ajax response on product list request
 */

Functions::defineIfNotDefined('NOTOKENRENEWAL', 1);  // Disables token renewal
Functions::defineIfNotDefined('NOREQUIREMENU', 1);  // If there is no need to load and show top and left menu
Functions::defineIfNotDefined('NOREQUIREHTML', 1); // If we don't need to load the html.form.class.php
Functions::defineIfNotDefined('NOREQUIREAJAX', 1); // Do not load ajax.lib.php library
Functions::defineIfNotDefined('NOREQUIRESOC', 1);   // No company needed
Functions::defineIfNotDefined('NOCSRFCHECK', 1);  // Do not check anti CSRF attack test
Functions::defineIfNotDefined('NOREQUIREHTML', 1); // If we don't need to load the html.form.class.php

// Load Dolibarr environment
require constant('DOL_DOCUMENT_ROOT') . '/main.inc.php';

$mode = GETPOST('mode', 'aZ09');

// Security check
restrictedArea($user, 'mymodule', 0, 'myobject');

/*
 * View
 */

dol_syslog("Call ajax mymodule/ajax/myobject.php");

ViewMain::topHttpHead('application/json');

$arrayresult = array();

// ....

$db->close();

print json_encode($arrayresult);
