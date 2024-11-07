<?php

/* Copyright (C) 2019       Laurent Destailleur (eldy)  <eldy@users.sourceforge.net>
 * Copyright (C) 2024       Frédéric France             <frederic.france@free.fr>
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
 *  \file       htdocs/mrp/ajax/interface.php
 *  \brief      Ajax search component for Mrp.
 */

Functions::defineIfNotDefined('NOREQUIRESOC', 1);   // No company needed
Functions::defineIfNotDefined('NOCSRFCHECK', 1);  // Do not check anti CSRF attack test
Functions::defineIfNotDefined('NOTOKENRENEWAL', 1);  // Disables token renewal
Functions::defineIfNotDefined('NOREQUIREMENU', 1);  // If there is no need to load and show top and left menu
Functions::defineIfNotDefined('NOREQUIREHTML', 1); // If we don't need to load the html.form.class.php
Functions::defineIfNotDefined('NOREQUIREAJAX', 1); // Do not load ajax.lib.php library

require constant('DOL_DOCUMENT_ROOT') . '/main.inc.php'; // Load $user and permissions

$warehouse_id = GETPOSTINT('warehouse_id');
$batch = GETPOST('batch', 'alphanohtml');
$fk_product = GETPOSTINT('product_id');
$action = GETPOST('action', 'alphanohtml');

$result = restrictedArea($user, 'mrp');

$permissiontoproduce = $user->hasRight('mrp', 'write');


/*
 * View
 */

ViewMain::topHttpHead("application/json");

if ($action == 'updateselectbatchbywarehouse' && $permissiontoproduce) {
    $TRes = array();

    $sql = "SELECT pb.batch, pb.rowid, ps.fk_entrepot, pb.qty, e.ref as label, ps.fk_product";
    $sql .= " FROM " . MAIN_DB_PREFIX . "product_batch as pb";
    $sql .= " LEFT JOIN " . MAIN_DB_PREFIX . "product_stock as ps on ps.rowid = pb.fk_product_stock";
    $sql .= " LEFT JOIN " . MAIN_DB_PREFIX . "entrepot as e on e.rowid = ps.fk_entrepot AND e.entity IN (" . getEntity('stock') . ")";
    $sql .= " WHERE ps.fk_product = " . ((int)$fk_product);
    if ($warehouse_id > 0) {
        $sql .= " AND fk_entrepot = '" . ((int)$warehouse_id) . "'";
    }
    $sql .= " ORDER BY e.ref, pb.batch";

    $resql = $db->query($sql);

    if ($resql) {
        while ($obj = $db->fetch_object($resql)) {
            if (empty($TRes[$obj->batch])) {
                $TRes[$obj->batch] = $obj->qty;
            } else {
                $TRes[$obj->batch] += $obj->qty;
            }
        }
    }

    echo json_encode($TRes);
} elseif ($action == 'updateselectwarehousebybatch' && $permissiontoproduce) {
    $res = 0;

    $sql = "SELECT pb.batch, pb.rowid, ps.fk_entrepot, e.ref, pb.qty";
    $sql .= " FROM " . MAIN_DB_PREFIX . "product_batch as pb";
    $sql .= " JOIN " . MAIN_DB_PREFIX . "product_stock as ps on ps.rowid = pb.fk_product_stock";
    $sql .= " JOIN " . MAIN_DB_PREFIX . "entrepot as e on e.rowid = ps.fk_entrepot AND e.entity IN (" . getEntity('stock') . ")";
    $sql .= " WHERE ps.fk_product = " . ((int)$fk_product);
    if ($batch) {
        $sql .= " AND pb.batch = '" . $db->escape($batch) . "'";
    }
    $sql .= " ORDER BY e.ref, pb.batch";

    $resql = $db->query($sql);

    if ($resql) {
        if ($db->num_rows($resql) == 1) {
            $obj = $db->fetch_object($resql);
            $res = $obj->fk_entrepot;
        }
    }

    echo json_encode($res);
}
