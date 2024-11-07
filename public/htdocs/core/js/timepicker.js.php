<?php

/* Copyright (C) 2012   Regis Houssin       <regis.houssin@inodbox.com>
 * Copyright (C) 2012	Laurent Destailleur	<eldy@users.sourceforge.net>
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
use Alxarafe\Lib\Functions;use Dolibarr\Lib\ViewMain;

/**
 * \file       htdocs/core/js/timepicker.js.php
 * \brief      File that include javascript functions for timepicker
 */

Functions::defineIfNotDefined('NOREQUIRESOC', 1);   // No company needed
Functions::defineIfNotDefined('NOCSRFCHECK', 1);  // Do not check anti CSRF attack test
Functions::defineIfNotDefined('NOTOKENRENEWAL', 1);  // Disables token renewal
Functions::defineIfNotDefined('NOLOGIN', 1);  // No login needed
Functions::defineIfNotDefined('NOREQUIREMENU', 1);  // If there is no need to load and show top and left menu
Functions::defineIfNotDefined('NOREQUIREHTML', 1); // If we don't need to load the html.form.class.php
Functions::defineIfNotDefined('NOREQUIREAJAX', 1); // Do not load ajax.lib.php library

session_cache_limiter('public');

require_once constant('DOL_DOCUMENT_ROOT') . '/main.inc.php';

/*
 * View
 */

// Define javascript type
ViewMain::topHttpHead('text/javascript; charset=UTF-8');
// Important: Following code is to avoid page request by browser and PHP CPU at each Dolibarr page access.
if (empty($dolibarr_nocache)) {
    header('Cache-Control: max-age=10800, public, must-revalidate');
} else {
    header('Cache-Control: no-cache');
}
?>

// For JQuery Timepicker
jQuery(function ($) {
    $.timepicker.regional['<?php echo $langs->defaultlang ?>'] = {
        timeOnlyTitle: '<?php echo $langs->trans("TimeOnly") ?>',
        timeText: '<?php echo $langs->trans("Time") ?>',
        hourText: '<?php echo $langs->trans("Hour") ?>',
        minuteText: '<?php echo $langs->trans("Minute") ?>',
        secondText: '<?php echo $langs->trans("Second") ?>',
        millisecText: '<?php echo $langs->trans("Millisecond") ?>',
        timezoneText: '<?php echo $langs->trans("Timezone") ?>',
        currentText: '<?php echo $langs->trans("Now") ?>',
        closeText: '<?php echo $langs->trans("Close2") ?>',
        timeFormat: 'HH:mm',
        amNames: ['AM', 'A'],
        pmNames: ['PM', 'P'],
        isRTL: <?php echo($langs->trans("DIRECTION") == 'rtl' ? 'true' : 'false'); ?>
    };
    $.timepicker.setDefaults($.timepicker.regional['<?php echo $langs->defaultlang ?>']);
});

<?php
if (is_object($db)) {
    $db->close();
}
