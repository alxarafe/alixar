<?php

/*
 * Copyright (C) 2014-2023  Frederic France             <frederic.france@netlogic.fr>
 * Copyright (C) 2024		MDW							<mdeweerd@users.noreply.github.com>
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

namespace Dolibarr\Code\Printing\Classes;

use DoliDB;

/**
 *      \file       htdocs/core/modules/printing/modules_printing.php
 *      \ingroup    printing
 *      \brief      File with parent class of printing modules
 */

require_once constant('DOL_DOCUMENT_ROOT') . '/core/lib/functions.lib.php';
require_once constant('DOL_DOCUMENT_ROOT') . '/core/lib/files.lib.php';

/**
 *      Parent class of emailing target selectors modules
 */
class PrintingDriver
{
    /**
     * @var DoliDB Database handler.
     */
    public $db;

    /**
     * @var string Error code (or message)
     */
    public $error = '';

    /**
     * @var string Name
     */
    public $name;

    /**
     * @var string Description
     */
    public $desc;

    /**
     * @var string Html string returned for print
     */
    public $resprint;

    /**
     *  Constructor
     *
     * @param DoliDB $db Database handler
     */
    public function __construct($db)
    {
        $this->db = $db;
    }

    /**
     *  Return list of printing driver
     *
     * @param DoliDB $db Database handler
     * @param int $maxfilenamelength Max length of value to show
     * @return array<string,string>        List of drivers
     */
    public static function listDrivers($db, $maxfilenamelength = 0)
    {
        global $conf;

        $type = 'printing';
        $list = array();

        $listoffiles = array();
        if (!empty($conf->modules_parts['printing'])) {
            $dirmodels = array_merge(array('/core/modules/printing/'), (array)$conf->modules_parts['printing']);
        } else {
            $dirmodels = array('/core/modules/printing/');
        }
        foreach ($dirmodels as $dir) {
            $tmpfiles = dol_dir_list(dol_buildpath($dir, 0), 'all', 0, '\.modules.php', '', 'name', SORT_ASC, 0);
            if (!empty($tmpfiles)) {
                $listoffiles = array_merge($listoffiles, $tmpfiles);
            }
        }
        foreach ($listoffiles as $record) {
            $list[$record['fullname']] = str_replace('.modules.php', '', $record['name']);
        }
        return $list;
    }

    /**
     *  Return description of Printing Module
     *
     * @return     string      Return translation of key PrintingModuleDescXXX where XXX is module name, or $this->desc if not exists
     */
    public function getDesc()
    {
        global $langs;
        $langs->load("printing");
        $transstring = "PrintingModuleDesc" . $this->name;
        if ($langs->trans($transstring) != $transstring) {
            return $langs->trans($transstring);
        } else {
            return $this->desc;
        }
    }
}
