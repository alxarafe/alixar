<?php

/* Copyright (C) 2019       Laurent Destailleur (eldy)  <eldy@users.sourceforge.net>
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
use Dolibarr\Code\Bom\Classes\BOM;
use Dolibarr\Lib\ViewMain;

/**
 *  \file       htdocs/mrp/ajax/ajax_bom.php
 *  \brief      Ajax search component for Mrp. It get BOM content.
 */

//if (! defined('NOREQUIREUSER'))   define('NOREQUIREUSER','1');    // Not disabled cause need to load personalized language
//if (! defined('NOREQUIREDB'))     define('NOREQUIREDB','1');      // Not disabled cause need to load personalized language
Functions::defineIfNotDefined('NOREQUIRESOC', 1);   // No company needed
//if (! defined('NOREQUIRETRAN'))       define('NOREQUIRETRAN','1');
Functions::defineIfNotDefined('NOTOKENRENEWAL', 1);  // Disables token renewal
Functions::defineIfNotDefined('NOREQUIREMENU', 1);  // If there is no need to load and show top and left menu
Functions::defineIfNotDefined('NOREQUIREHTML', 1); // If we don't need to load the html.form.class.php
Functions::defineIfNotDefined('NOREQUIREAJAX', 1); // Do not load ajax.lib.php library

// Load Dolibarr environment
require constant('DOL_DOCUMENT_ROOT') . '/main.inc.php'; // Load $user and permissions

$idbom = GETPOST('idbom', 'alpha');
//$action = GETPOST('action', 'aZ09');

$object = new BOM($db);
$result = $object->fetch($idbom);

// Security check
$isdraft = (($object->status == $object::STATUS_DRAFT) ? 1 : 0);
$result = restrictedArea($user, 'bom', $object, $object->table_element, '', '', 'rowid', $isdraft);


/*
 * View
 */

ViewMain::topHttpHead('application/json');

if ($result > 0) {
    // We remove properties we don't need in answer
    unset($object->fields);
    unset($object->db);
    echo json_encode($object);
} else {
    echo 'Failed to load category with id=' . $idbom;
}
