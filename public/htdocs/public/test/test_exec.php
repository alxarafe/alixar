<?php

/* Copyright (C) 2024       Rafael San José             <rsanjose@alxarafe.com>
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

Functions::defineIfNotDefined('NOREQUIREUSER', 1);   // No user needed
Functions::defineIfNotDefined('NOREQUIREDB', 1);   // No database needed
Functions::defineIfNotDefined('NOREQUIRESOC', 1);   // No company needed
Functions::defineIfNotDefined('NOREQUIRETRAN', 1);   // No translations needed
Functions::defineIfNotDefined('NOSTYLECHECK', 1); // Do not check style html tag into posted data
Functions::defineIfNotDefined('NOREQUIREMENU', 1);  // If there is no need to load and show top and left menu
Functions::defineIfNotDefined('NOREQUIREHTML', 1); // If we don't need to load the html.form.class.php
Functions::defineIfNotDefined('NOREQUIREAJAX', 1); // Do not load ajax.lib.php library
Functions::defineIfNotDefined('NOLOGIN', 1);  // File must be accessed by logon page so without login
// If you don't need session management (can't be logged if no session used). You must also set
// NOCSRFCHECK, NOTOKENRENEWAL, NOLOGIN
// Disable module with GETPOST('disablemodules') won't work. Variable 'dol_...' will not be set.
// $_SESSION are then simple vars if sessions are not active.
// TODO We can close session with session_write_close() as soon as we just need read access everywhere in code.
Functions::defineIfNotDefined('NOSESSION', 1);   // On CLI mode, no need to use web sessions

// Load Dolibarr environment
require constant('DOL_DOCUMENT_ROOT') . '/main.inc.php';

// Security
if ($dolibarr_main_prod) {
    accessforbidden('Access forbidden when $dolibarr_main_prod is set to 1');
}


/*
 * View
 */

header("Content-type: text/html; charset=UTF8");

// Security options
header("X-Content-Type-Options: nosniff"); // With the nosniff option, if the server says the content is text/html, the browser will render it as text/html (note that most browsers now force this option to on)
header("X-Frame-Options: SAMEORIGIN"); // Frames allowed only if on same domain (stop some XSS attacks)

print "*** TEST READ OF /tmp/test.txt FILE<br>\n";

$out = '';
$ret = 0;

$file = '/tmp/test.txt';
$f = fopen($file, 'r');
if ($f) {
    $s = fread($f, 4096);
    print $s;
    fclose($f);
} else {
    print "Failed to open file " . $file . "<br>\n";
}

print '<br><br>' . "\n";


print "*** TEST READ OF /test.txt FILE AND LS /dev/std*<br>\n";

exec('cat /test.txt; ls /dev/std*; sleep 1;', $out, $ret);
print "ret=" . $ret . "<br>\n";
print_r($out);
print '<br>';

print '<br><br>' . "\n";


print "*** TRY TO RUN CLAMDSCAN<br>\n";

$ret = 0;
$out = null;
exec('/usr/bin/clamdscan --fdpass filethatdoesnotexists.php', $out, $ret);
print "ret=" . $ret . "<br>\n";
print_r($out);
