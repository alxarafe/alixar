<?php

/* Copyright (C) 2017       Laurent Destailleur         <eldy@users.sourceforge.net>
 * Copyright (C) 2017       ATM Consulting              <contact@atm-consulting.fr>
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

use Dolibarr\Code\Compta\Classes\Facture;

/**
 *      \file       htdocs/blockedlog/ajax/block-add.php
 *      \ingroup    blockedlog
 *      \brief      block-add
 */

// This script is called with a POST method.
// Directory to scan (full path) is inside POST['dir'].

if (!defined('NOTOKENRENEWAL')) {
    define('NOTOKENRENEWAL', 1); // Disables token renewal
}
if (!defined('NOREQUIREMENU')) {
    define('NOREQUIREMENU', '1');
}
if (!defined('NOREQUIREHTML')) {
    define('NOREQUIREHTML', '1');
}

$res = require constant('DOL_DOCUMENT_ROOT') . '/main.inc.php';

$id = GETPOSTINT('id');
$element = GETPOST('element', 'alpha');
$action = GETPOST('action', 'aZ09');

if ($element === 'facture') {
    $result = restrictedArea($user, 'facture', $id, '', '', 'fk_soc', 'rowid', 0);
} else {
    accessforbidden('Bad value for element');
}

/*
 * View
 */

top_httphead();

if (empty($action)) {
    print 'No action logged. Empty action code.';
    exit;
}

if ($element === 'facture') {

    $facture = new Facture($db);
    if ($facture->fetch($id) > 0) {
        $facture->call_trigger($action, $user);
    }

    print 'Object ' . $element . ' logged with action code = ' . $action;
}
