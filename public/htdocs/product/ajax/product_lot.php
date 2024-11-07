<?php

/* Copyright (C) 2023       Laurent Destailleur         <eldy@users.sourceforge.net>
 * Copyright (C) 2023       Lionel Vessiller     	    <lvessiller@easya.solutions>
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
use Dolibarr\Code\Product\Classes\Productlot;
use Dolibarr\Lib\ViewMain;

/**
 *  \file       htdocs/product/ajax/product_lot.php
 *  \brief      Ajax search component for ProductLot.
 */

Functions::defineIfNotDefined('NOTOKENRENEWAL', 1);  // Disables token renewal
Functions::defineIfNotDefined('NOREQUIREMENU', 1);  // If there is no need to load and show top and left menu
Functions::defineIfNotDefined('NOREQUIREHTML', 1); // If we don't need to load the html.form.class.php
Functions::defineIfNotDefined('NOREQUIREAJAX', 1); // Do not load ajax.lib.php library
Functions::defineIfNotDefined('NOBROWSERNOTIF', 1);  // Disable browser notification

// Load Dolibarr environment
require constant('DOL_DOCUMENT_ROOT') . '/main.inc.php'; // Load $user and permissions

$action = GETPOST('action', 'aZ09');
$productId = GETPOSTINT('product_id');
$batch = GETPOST('batch', 'alphanohtml');

// Security check
restrictedArea($user, 'produit|service', $productId, 'product&product');


/*
 * View
 */

ViewMain::topHttpHead('application/json');

$rows = array();

if ($action == 'search' && $batch != '') {
    $productLot = new Productlot($db);
    $result = $productLot->fetch('', $productId, $batch);

    if ($result > 0 && $productLot->id > 0) {
        $rows[] = array(
            'rowid' => $productLot->id,
            'sellby' => ($productLot->sellby ? dol_print_date($productLot->sellby, 'day') : ''),
            'eatby' => ($productLot->eatby ? dol_print_date($productLot->eatby, 'day') : ''),
        );
    }
}

echo json_encode($rows);
exit();
