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

//define("NOLOGIN",1);      // This means this output page does not require to be logged.
//if (!defined('NOREQUIREUSER'))  define('NOREQUIREUSER', '1');
//if (!defined('NOREQUIREDB'))    define('NOREQUIREDB', '1');
if (!defined('NOREQUIRESOC')) {
    define('NOREQUIRESOC', '1');
}
//if (!defined('NOREQUIRETRAN'))  define('NOREQUIRETRAN', '1');
if (!defined('NOSTYLECHECK')) {
    define('NOSTYLECHECK', '1'); // Do not check style html tag into posted data
}
//if (!defined('NOREQUIREMENU'))  define('NOREQUIREMENU', '1'); // If there is no need to load and show top and left menu
//if (!defined('NOREQUIREHTML'))  define('NOREQUIREHTML', '1'); // If we don't need to load the html.form.class.php
//if (!defined('NOREQUIREAJAX'))  define('NOREQUIREAJAX', '1'); // Do not load ajax.lib.php library
if (!defined("NOLOGIN")) {
    define("NOLOGIN", '1'); // If this page is public (can be called outside logged session)
}

// Load Dolibarr environment
require constant('DOL_DOCUMENT_ROOT') . '/main.inc.php';

// Security
if ($dolibarr_main_prod) {
    accessforbidden();
}


/*
 * View
 */

header("Content-type: text/html; charset=UTF8");

// Security options
header("X-Content-Type-Options: nosniff"); // With the nosniff option, if the server says the content is text/html, the browser will render it as text/html (note that most browsers now force this option to on)
header("X-Frame-Options: SAMEORIGIN"); // Frames allowed only if on same domain (stop some XSS attacks)
?>

This is a form to test if a CSRF exists into a Dolibarr page.<br>
<br>
- Change url to send request to into this file (URL to a hard coded page on a server B)<br>
- Open this form into a virtual server A.<br>
- Send the request to the virtual server B by clicking submit.<br>
- Check that Anticsrf protection is triggered.<br>

<br>
<?php
$urltosendrequest = constant('BASE_URL') . '/user/group/card.php';
print 'urltosendrequest = ' . $urltosendrequest . '<br><br>';
?>

Test post
<form method="POST" action="<?php echo $urltosendrequest; ?>" target="_blank">
    <!-- <input type="hidden" name="token" value="123456789"> -->
    <input type="text" name="action" value="add">
    <input type="text" name="nom" value="New group test">
    <input type="submit" name="submit" value="Submit">
</form>


Test logout
<html>
<body>
<script>history.pushState('', '', '/')</script>
<form action="<?= constant('BASE_URL') ?>/user/logout.php">
    <input type="submit" value="Submit request"/>
</form>
<script>
    document.forms[0].submit();
</script>
</body>
</html>
