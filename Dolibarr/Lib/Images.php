<?php

namespace Dolibarr\Lib;

abstract class Images
{
    /**
     * Gets the path of the logo.
     *
     * @param string $theme
     * @param int $width
     * @param string $logo_small
     * @param string $logo
     * @param bool $only_company
     *
     * @return string|false
     */
    public static function getLogo(string $theme, int &$width, string $logo_small = '', string $logo = '', bool $only_company = false)
    {
        // Define company logo directory
        $companyOutDir = constant('DOL_DATA_ROOT') . '/mycompany';

        // Check for small logo in thumbs directory
        if (!empty($logo_small) && is_readable($companyOutDir . '/logos/thumbs/' . $logo_small)) {
            return constant('BASE_URL') . '/viewimage.php?cache=1&amp;modulepart=mycompany&amp;file=' . urlencode('logos/thumbs/' . $logo_small);
        }

        // Check for main logo in logos directory
        if (!empty($logo) && is_readable($companyOutDir . '/logos/' . $logo)) {
            $width = 128;
            return constant('BASE_URL') . '/viewimage.php?cache=1&amp;modulepart=mycompany&amp;file=' . urlencode('logos/' . $logo);
        }

        if ($only_company) {
            return false;
        }

        // Check for theme specific logo
        if (is_readable(constant('DOL_DOCUMENT_ROOT') . '/theme/' . $theme . '/img/alixar_rectangular_logo.svg')) {
            return constant('BASE_URL') . '/theme/' . $theme . '/img/alixar_rectangular_logo.svg';
        }

        // Check for default logo
        if (is_readable(constant('DOL_DOCUMENT_ROOT') . '/theme/common/alixar_rectangular_logo.svg')) {
            return constant('BASE_URL') . '/theme/common/alixar_rectangular_logo.svg';
        }

        // Return default padlock logo if no other logo is found
        return constant('BASE_URL') . '/theme/common/login_logo.png';
    }
}
