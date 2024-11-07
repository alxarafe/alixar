<?php

/* Copyright (C) 2005-2007 Laurent Destailleur  <eldy@users.sourceforge.net>
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
 * or see https://www.gnu.org/
 */

use Alxarafe\Lib\Functions;
use Dolibarr\Lib\ViewMain;

/**
 *      \file       htdocs/core/antispamimage.php
 *      \brief      Return antispam image
 */

define('NOLOGIN', 1);

Functions::defineIfNotDefined('NOREQUIREUSER', 1);   // No user needed
Functions::defineIfNotDefined('NOREQUIREDB', 1);   // No database needed
Functions::defineIfNotDefined('NOREQUIRETRAN', 1);   // No translations needed
Functions::defineIfNotDefined('NOREQUIREMENU', 1);  // If there is no need to load and show top and left menu
Functions::defineIfNotDefined('NOREQUIRESOC', 1);   // No company needed
Functions::defineIfNotDefined('NOTOKENRENEWAL', 1);  // Disables token renewal

require_once constant('DOL_DOCUMENT_ROOT') . '/main.inc.php';


/*
 * View
 */

$length = 5;
$letters = 'aAbBCDeEFgGhHJKLmMnNpPqQRsStTuVwWXYZz2345679';
$number = strlen($letters);
$string = '';
for ($i = 0; $i < $length; $i++) {
    $string .= $letters[mt_rand(0, $number - 1)];
}
//print $string;


$sessionkey = 'dol_antispam_value';
$_SESSION[$sessionkey] = $string;

$img = imagecreate(80, 32);
if (empty($img)) {
    dol_print_error(null, "Problem with GD creation");
    exit;
}

// Define mime type
ViewMain::topHttpHead('image/png', 1);

$background_color = imagecolorallocate($img, 250, 250, 250);
$ecriture_color = imagecolorallocate($img, 0, 0, 0);
imagestring($img, 4, 24, 8, $string, $ecriture_color);
imagepng($img);
