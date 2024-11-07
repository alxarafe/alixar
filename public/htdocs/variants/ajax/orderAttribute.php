<?php

/* Copyright (C) 2016       Marcos García               <marcosgdf@gmail.com>
 * Copyright (C) 2022       Open-Dsi		            <support@open-dsi.fr>
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
use Dolibarr\Code\Variants\Classes\ProductAttribute;

Functions::defineIfNotDefined('NOTOKENRENEWAL', 1);  // Disables token renewal
Functions::defineIfNotDefined('NOREQUIREMENU', 1);  // If there is no need to load and show top and left menu
Functions::defineIfNotDefined('NOREQUIREHTML', 1); // If we don't need to load the html.form.class.php
Functions::defineIfNotDefined('NOREQUIREAJAX', 1); // Do not load ajax.lib.php library
Functions::defineIfNotDefined('NOREQUIRESOC', 1);   // No company needed
Functions::defineIfNotDefined('NOREQUIRETRAN', 1);   // No translations needed

// Load Dolibarr environment
require constant('DOL_DOCUMENT_ROOT') . '/main.inc.php';
require DOL_DOCUMENT_ROOT . '/variants/class/ProductAttribute.class.php';

// Security check
if (!isModEnabled('variants')) {
    accessforbidden('Module not enabled');
}
if ($user->socid > 0) { // Protection if external user
    accessforbidden();
}
$result = restrictedArea($user, 'variants');


/*
 * View
 */

ViewMain::topHttpHead();

print '<!-- Ajax page called with url ' . dol_escape_htmltag($_SERVER["PHP_SELF"]) . '?' . dol_escape_htmltag($_SERVER["QUERY_STRING"]) . ' -->' . "\n";

// Registering the location of boxes
if (GETPOST('roworder', 'alpha', 3)) {
    $roworder = GETPOST('roworder', 'alpha', 3);

    dol_syslog("AjaxOrderAttribute roworder=" . $roworder, LOG_DEBUG);

    $rowordertab = explode(',', $roworder);
    $newrowordertab = array();
    foreach ($rowordertab as $value) {
        if (!empty($value)) {
            $newrowordertab[] = $value;
        }
    }

    $row = new ProductAttribute($db);

    $row->attributesAjaxOrder($newrowordertab); // This update field rank or position in table row->table_element_line
} else {
    print 'Bad parameters for orderAttribute.php';
}
