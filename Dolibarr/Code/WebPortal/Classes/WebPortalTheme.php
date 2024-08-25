<?php

/* Copyright (C) 2023-2024  Laurent Destailleur         <eldy@users.sourceforge.net>
 * Copyright (C) 2023-2024	Lionel Vessiller		    <lvessiller@easya.solutions>
 * Copyright (C) 2023-2024	John Botella			    <john.botella@atm-consulting.fr>
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

namespace Dolibarr\Code\WebPortal\Classes;

use DoliDB;

/**
 * \file       htdocs/webportal/class/webPortalTheme.class.php
 * \ingroup    webportal
 * \brief      File of class with theme definition for WebPortal
 */

require_once constant('DOL_DOCUMENT_ROOT') . '/core/lib/functions2.lib.php'; // used for color functions

/**
 * Class WebPortalTheme
 */
class WebPortalTheme
{
    public $primaryColorHex = '#263c5c';
    public $primaryColorHsl = array(
        'h' => 216, // Hue
        'l' => 42,  // lightness
        's' => 25,  // Saturation
        'a' =>  1   // Alfa
    );


    public $loginLogoUrl;
    public $menuLogoUrl;
    public $loginBackground;

    /**
     * @var string Background of banner
     */
    public $bannerBackground;

    /**
     * @var int Use dark theme on banner
     */
    public $bannerUseDarkTheme;


    /**
     * Constructor
     */
    public function __construct()
    {
        global $mysoc, $conf;

        $this->loadPrimaryColor();

        $width = 0;
        $urllogo = Images::getLogo($conf->theme, $width, $mysoc->logo_small, $mysoc->logo);

        $this->loginLogoUrl = getDolGlobalString('WEBPORTAL_LOGIN_LOGO_URL', $urllogo);
        $this->menuLogoUrl = getDolGlobalString('WEBPORTAL_MENU_LOGO_URL', $this->loginLogoUrl);
        $this->loginBackground = getDolGlobalString('WEBPORTAL_LOGIN_BACKGROUND');
        $this->bannerBackground = getDolGlobalString('WEBPORTAL_BANNER_BACKGROUND');
        $this->bannerUseDarkTheme = getDolGlobalInt('WEBPORTAL_BANNER_BACKGROUND_IS_DARK');
    }

    /**
     * Load hex of primary theme color
     *
     * @return void
     */
    public function loadPrimaryColor()
    {
        $outColor = '';

        if (getDolGlobalString('WEBPORTAL_PRIMARY_COLOR')) {
            $outColor = getDolGlobalString('WEBPORTAL_PRIMARY_COLOR');
        } elseif (getDolGlobalString('THEME_ELDY_TOPMENU_BACK1')) {
            $outColor = colorArrayToHex(colorStringToArray(getDolGlobalString('THEME_ELDY_TOPMENU_BACK1')));
        }
        if (strpos($outColor, '#') !== 0) {
            $outColor = '#' . $outColor;
        }

        // If custom color is valid, w e use it
        if (!empty($outColor) && colorValidateHex($outColor)) {
            $this->primaryColorHex = $outColor;
            $this->primaryColorHsl = colorHexToHsl($outColor, true, true);
        }
    }
}
