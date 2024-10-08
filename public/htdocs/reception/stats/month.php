<?php

/* Copyright (C) 2001-2003  Rodolphe Quiedeville        <rodolphe@quiedeville.org>
 * Copyright (C) 2004-2009  Laurent Destailleur         <eldy@users.sourceforge.net>
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

use Dolibarr\Code\Core\Classes\DolGraph;
use Dolibarr\Code\Reception\Classes\ReceptionStats;

/**
 *    \file       htdocs/reception/stats/month.php
 *    \ingroup    order
 *    \brief      Page des stats receptions par mois
 */

// Load Dolibarr environment
require constant('DOL_DOCUMENT_ROOT') . '/main.inc.php';

$year = GETPOSTINT("year");
$socid = GETPOSTINT("socid");
$userid = GETPOSTINT("userid");

// Security check
if ($user->socid) {
    $socid = $user->socid;
}
$result = restrictedArea($user, 'reception', 0, '');


/*
 * View
 */

llxHeader();

$WIDTH = DolGraph::getDefaultGraphSizeForStats('width');
$HEIGHT = DolGraph::getDefaultGraphSizeForStats('height');

$mesg = '';

print load_fiche_titre($langs->trans("StatisticsOfReceptions") . ' ' . GETPOSTINT("year"), $mesg);
$stats = new ReceptionStats($db, $socid, '', ($userid > 0 ? $userid : 0));
$data = $stats->getNbByMonth($year);

dol_mkdir($conf->reception->dir_temp);

$filename = $conf->reception->dir_temp . "/reception" . $year . ".png";
$fileurl = constant('BASE_URL') . '/viewimage.php?modulepart=receptionstats&file=reception' . $year . '.png';

$px = new DolGraph();
$mesg = $px->isGraphKo();
if (!$mesg) {
    $px->SetData($data);
    $px->SetMaxValue($px->GetCeilMaxValue());
    $px->SetWidth($WIDTH);
    $px->SetHeight($HEIGHT);
    $px->SetYLabel($langs->trans("NbOfOrders"));
    $px->SetShading(3);
    $px->SetHorizTickIncrement(1);
    $px->draw($filename, $fileurl);
}

print '<table class="border centpercent">';
print '<tr><td class="center">Nombre d reception par mois</td>';
print '<td class="center">';
print $px->show();
print '</td></tr>';
print '</table>';

llxFooter();

$db->close();
