<?php

/* Copyright (C) 2023-2024  Laurent Destailleur     <eldy@users.sourceforge.net>
 * Copyright (C) 2023-2024	Lionel Vessiller		<lvessiller@easya.solutions>
 * Copyright (C) 2024		Frédéric France			<frederic.france@free.fr>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */
use Alxarafe\Lib\Functions;

/**
 * \file    htdocs/public/webportal/css/themes/custom.css.php
 * \ingroup webportal
 * \brief   Custom css files for WebPortal
 */

Functions::defineIfNotDefined('NOREQUIRESOC', 1);   // No company needed
Functions::defineIfNotDefined('NOCSRFCHECK', 1);  // Do not check anti CSRF attack test
Functions::defineIfNotDefined('NOTOKENRENEWAL', 1);  // Disables token renewal
Functions::defineIfNotDefined('NOLOGIN', 1); // File must be accessed by logon page so without login.
Functions::defineIfNotDefined('NOREQUIREHTML', 1); // If we don't need to load the html.form.class.php
Functions::defineIfNotDefined('NOREQUIREAJAX', 1); // Do not load ajax.lib.php library

session_cache_limiter('public');

require_once __DIR__ . '/../../webportal.main.inc.php';

// Define css type
// ViewCss::topHttpHead();
header("Content-Type: text/css");
header("X-Content-Type-Options: nosniff");
header("X-Frame-Options: SAMEORIGIN");

// Important: Following code is to avoid page request by browser and PHP CPU at each Dolibarr page access.
// if (empty($dolibarr_nocache)) {
    header('Cache-Control: max-age=10800, public, must-revalidate');
/* } else {
    header('Cache-Control: no-cache');
} */

$webPortalTheme = new WebPortalTheme();

?>
[data-theme="custom"], :root {
    --primary-color-hue: <?php print $webPortalTheme->primaryColorHsl['h']; ?>;
    --primary-color-saturation: <?php print $webPortalTheme->primaryColorHsl['s']; ?>%;
    --primary-color-lightness: <?php print $webPortalTheme->primaryColorHsl['l']; ?>%;
    --banner-background: url(<?php print !empty($webPortalTheme->bannerBackground) ? $webPortalTheme->bannerBackground : '../img/banner.svg' ?>);
}

.login-page {
<?php
if (!empty($webPortalTheme->loginBackground)) {
    print '--login-background: rgba(0, 0, 0, 0.4) url("' . $webPortalTheme->loginBackground . '");' . "\n";
}

if (!empty($webPortalTheme->loginLogoUrl)) {
    print '--login-logo: url("' . $webPortalTheme->loginLogoUrl . '"); /* for relative path, must be relative to the css file or use full url starting by http:// */' . "\n";
}
?>
}

<?php

print '/* Here, the content of the common custom CSS defined into Home - Setup - Display - CSS' . "*/\n";
print getDolGlobalString('WEBPORTAL_CUSTOM_CSS');
