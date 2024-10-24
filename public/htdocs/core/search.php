<?php

/* Copyright (C) 2015 Laurent Destailleur  <eldy@users.sourceforge.net>
 *
 * This file is a modified version of datepicker.php from phpBSM to fix some
 * bugs, to add new features and to dramatically increase speed.
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

use Dolibarr\Lib\ViewMain;

/**
 *       \file       htdocs/core/search.php
 *       \brief      Wrapper that receive any search. Depending on input field, make a redirect to correct URL.
 */

if (!defined('NOREQUIREUSER')) {
    define('NOREQUIREUSER', '1');
}
if (!defined('NOREQUIREDB')) {
    define('NOREQUIREDB', '1');
}
if (!defined('NOREQUIRESOC')) {
    define('NOREQUIRESOC', '1');
}
if (!defined('NOREQUIRETRAN')) {
    define('NOREQUIRETRAN', '1');
}
if (!defined('NOCSRFCHECK')) {
    define('NOCSRFCHECK', 1);
}
if (!defined('NOTOKENRENEWAL')) {
    define('NOTOKENRENEWAL', 1);
}
if (!defined('NOLOGIN')) {
    define('NOLOGIN', 1);
}
if (!defined('NOREQUIREMENU')) {
    define('NOREQUIREMENU', 1);
}

require_once constant('DOL_DOCUMENT_ROOT') . '/main.inc.php';


/*
 * Actions
 */

if (GETPOST('search_proposal') != '') {
    header("Location: " . constant('BASE_URL') . '/comm/propal/list.php?sall=' . urlencode(GETPOST('search_proposal')));
    exit;
}
if (GETPOST('search_customer_order') != '') {
    header("Location: " . constant('BASE_URL') . '/commande/list.php?sall=' . urlencode(GETPOST('search_customer_order')));
    exit;
}
if (GETPOST('search_supplier_order') != '') {
    header("Location: " . constant('BASE_URL') . '/fourn/commande/list.php?search_all=' . urlencode(GETPOST('search_supplier_order')));
    exit;
}
if (GETPOST('search_intervention') != '') {
    header("Location: " . constant('BASE_URL') . '/fichinter/list.php?sall=' . urlencode(GETPOST('search_intervention')));
    exit;
}
if (GETPOST('search_contract') != '') {
    header("Location: " . constant('BASE_URL') . '/contrat/list.php?sall=' . urlencode(GETPOST('search_contract')));
    exit;
}
if (GETPOST('search_invoice') != '') {
    header("Location: " . constant('BASE_URL') . '/compta/facture/list.php?sall=' . urlencode(GETPOST('search_invoice')));
    exit;
}
if (GETPOST('search_supplier_invoice') != '') {
    header("Location: " . constant('BASE_URL') . '/fourn/facture/list.php?sall=' . urlencode(GETPOST('search_supplier_invoice')));
    exit;
}
if (GETPOST('search_supplier_proposal') != '') {
    header("Location: " . constant('BASE_URL') . '/supplier_proposal/list.php?sall=' . urlencode(GETPOST('search_supplier_proposal')));
    exit;
}
if (GETPOST('search_donation') != '') {
    header("Location: " . constant('BASE_URL') . '/don/list.php?sall=' . urlencode(GETPOST('search_donation')));
    exit;
}
if (GETPOST('search_product') != '') {
    header("Location: " . constant('BASE_URL') . '/product/list.php?sall=' . urlencode(GETPOST('search_product')));
    exit;
}
if (GETPOST('search_thirdparty') != '') {
    header("Location: " . constant('BASE_URL') . '/societe/list.php?mode=search&sall=' . urlencode(GETPOST('search_thirdparty')));
    exit;
}
if (GETPOST('search_contact') != '') {
    header("Location: " . constant('BASE_URL') . '/contact/list.php?mode=search&sall=' . urlencode(GETPOST('search_contact')));
    exit;
}
if (GETPOST('search_deplacement') != '') {
    header("Location: " . constant('BASE_URL') . '/compta/deplacement/list.php?mode=search&sall=' . urlencode(GETPOST('search_deplacement')));
    exit;
}
if (GETPOST('search_expensereport') != '') {
    header("Location: " . constant('BASE_URL') . '/expensereport/list.php?mode=search&sall=' . urlencode(GETPOST('search_expensereport')));
    exit;
}
if (GETPOST('search_holiday') != '') {
    header("Location: " . constant('BASE_URL') . '/holiday/list.php?mode=search&sall=' . urlencode(GETPOST('search_holiday')));
    exit;
}
if (GETPOST('search_member') != '') {
    header("Location: " . constant('BASE_URL') . '/adherents/list.php?mode=search&sall=' . urlencode(GETPOST('search_member')));
    exit;
}
if (GETPOST('search_project') != '') {
    header("Location: " . constant('BASE_URL') . '/projet/list.php?mode=search&search_all=' . urlencode(GETPOST('search_project')));
    exit;
}
if (GETPOST('search_task') != '') {
    header("Location: " . constant('BASE_URL') . '/projet/tasks/list.php?mode=search&search_all=' . urlencode(GETPOST('search_task')));
    exit;
}

if (GETPOST('search_user') != '') {
    header("Location: " . constant('BASE_URL') . '/user/list.php?search_all=' . urlencode(GETPOST('search_user')));
    exit;
}
if (GETPOST('search_group') != '') {
    header("Location: " . constant('BASE_URL') . '/user/group/list.php?search_all=' . urlencode(GETPOST('search_group')));
    exit;
}


// If we are here, search was called with no supported criteria
if (!empty($_SERVER['HTTP_REFERER'])) {
    header("Location: " . $_SERVER['HTTP_REFERER']);
    exit;
} else {
    print 'The wrapper search.php was called without any search criteria';
}
