<?php

/* Copyright (C) 2001-2003  Rodolphe Quiedeville        <rodolphe@quiedeville.org>
 * Copyright (C) 2010       Laurent Destailleur         <eldy@users.sourceforge.net>
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

/**
 *      \file       htdocs/externalsite/frametop.php
 *      \ingroup    externalsite
 *      \brief      Top frame to show external web application
 */

require constant('DOL_DOCUMENT_ROOT') . '/main.inc.php';

// Load translation files required by the page
$langs->load("other");

top_htmlhead("", "");

print '<body id="mainbody">' . "\n";

top_menu("", "", "_top");

print '</body>';
