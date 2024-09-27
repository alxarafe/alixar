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

namespace Dolibarr\Core\Base;

use Alxarafe\Base\Controller\GenericController;

global $conf;
global $db;
global $user;
global $hookmanager;
global $menumanager;
global $langs;
global $mysoc;

// Load Dolibarr environment
require constant('DOL_DOCUMENT_ROOT') . '/main.inc.php';

/**
 * Class DolibarrGenericController. The generic controller contains what is necessary for any controller
 *
 * This class is only needed for compatibility with Dolibarr.
 *
 * @package DoliCore\Base
 */
abstract class DolibarrGenericController extends GenericController
{
    public $conf;
    public $db;
    public $user;
    public $hookmanager;
    public $menumanager;
    public $langs;
    public $mysoc;

    /**
     * GenericController constructor.
     */
    public function __construct()
    {
        parent::__construct();

        global $conf;
        global $db;
        global $hookmanager;
        global $user;
        global $menumanager;
        global $langs;
        global $mysoc;

        $this->conf = $conf;
        $this->db = $db;
        $this->hookmanager = $hookmanager;
        $this->user = $user;
        $this->menumanager = $menumanager;
        $this->langs = $langs;
        $this->mysoc = $mysoc;

        $method = filter_input(INPUT_GET, METHOD_VAR) ?? METHOD_DEFAULT_VALUE;
        if (method_exists($this, $method)) {
            return $this->{$method}();
        }
        return true;
    }

    /**
     * Returns the generic url of the controller;
     *
     * @param $full
     *
     * @return string
     */
    public static function url($full = false)
    {
        $url = '';

        if ($full) {
            $url .= BASE_URL . '/index.php';
        }

        $url .=
            '?' . MODULE_NAME_VAR . '=' . filter_input(INPUT_GET, MODULE_NAME_VAR) .
            '&' . CONTROLLER_VAR . '=' . filter_input(INPUT_GET, CONTROLLER_VAR);

        $method = filter_input(INPUT_GET, METHOD_VAR);
        if (isset($method)) {
            $url .= '&' . METHOD_VAR . '=' . $method;
        }

        return $url;
    }

    public function syslog($message, $level = LOG_DEBUG)
    {
        if (!defined('LOG_DEBUG')) {
            define('LOG_DEBUG', 6);
        }
        dol_syslog($message, $level);
    }
}
