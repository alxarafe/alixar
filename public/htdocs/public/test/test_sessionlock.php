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

use Dolibarr\Code\Core\Classes\Form;

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
if (!defined('NOSTYLECHECK')) {
    define('NOSTYLECHECK', '1'); // Do not check style html tag into posted data
}
if (!defined('NOREQUIREMENU')) {
    define('NOREQUIREMENU', '1'); // If there is no need to load and show top and left menu
}
if (!defined('NOREQUIREHTML')) {
    define('NOREQUIREHTML', '1'); // If we don't need to load the html.form.class.php
}
if (!defined('NOREQUIREAJAX')) {
    define('NOREQUIREAJAX', '1'); // Do not load ajax.lib.php library
}
if (!defined("NOLOGIN")) {
    define("NOLOGIN", '1'); // If this page is public (can be called outside logged session)
}
// If you don't need session management (can't be logged if no session used). You must also set
// NOCSRFCHECK, NOTOKENRENEWAL, NOLOGIN
// Disable module with GETPOST('disablemodules') won't work. Variable 'dol_...' will not be set.
// $_SESSION are then simple vars if sessions are not active.
// TODO We can close session with session_write_close() as soon as we just need read access everywhere in code.
if (!defined("NOSESSION")) {
    define("NOSESSION", '1');
}


// Special
// We add header and output some content before the include of main.inc.php !!
// Because we need to So we can make
header("Content-type: text/html; charset=UTF8");

// Security options
header("X-Content-Type-Options: nosniff"); // With the nosniff option, if the server says the content is text/html, the browser will render it as text/html (note that most browsers now force this option to on)
header("X-Frame-Options: SAMEORIGIN"); // Frames allowed only if on same domain (stop some XSS attacks)


print "Legend:<br>\n";
print 'PHP_SESSION_DISABLED=' . PHP_SESSION_DISABLED . "<br>\n";
print 'PHP_SESSION_NONE=' . PHP_SESSION_NONE . "<br>\n";
print 'PHP_SESSION_ACTIVE=' . PHP_SESSION_ACTIVE . "<br>\n";
print '<br>';

print 'session_status=' . session_status() . ' (before main.inc.php)';
print '<br>';

// Load Dolibarr environment
require constant('DOL_DOCUMENT_ROOT') . '/main.inc.php';

// Security
if ($dolibarr_main_prod) {
    accessforbidden();
}


/*
 * View
 */

print 'session_status=' . session_status() . ' (after main.inc.php)';
print '<br>';

//print 'a'.$_SESSION['disablemodules'].'b';

print "\n<br>This page is visible. It means you are not locked by another page called in same session.";

//session_write_close();
