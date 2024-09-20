<?php

/* Copyright (C) 2003-2005  Rodolphe Quiedeville        <rodolphe@quiedeville.org>
 * Copyright (C) 2004-2010  Laurent Destailleur         <eldy@users.sourceforge.net>
 * Copyright (C) 2004       Eric Seigne                 <eric.seigne@ryxeo.com>
 * Copyright (C) 2005-2012  Regis Houssin               <regis.houssin@inodbox.com>
 * Copyright (C) 2024		Frédéric France			    <frederic.france@free.fr>
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

namespace Dolibarr\Code\Societe\Classes;

use Dolibarr\Code\Core\Classes\CommonNumRefGenerator;
use Dolibarr\Code\Core\Classes\Translate;
use DoliDB;

/**
 *      Parent class for third parties accountancy code generators
 */
abstract class ModeleAccountancyCode extends CommonNumRefGenerator
{
    /**
     * @var string
     */
    public $code;

    /**
     *  Return description of module parameters
     *
     * @param Translate $langs Output language
     * @param Societe $soc Third party object
     * @param int $type -1=Nothing, 0=Customer, 1=Supplier
     * @return string                  HTML translated description
     */
    public function getToolTip($langs, $soc, $type)
    {
        global $db;

        $langs->load("admin");

        $s = '';
        if ($type == -1) {
            $s .= $langs->trans("Name") . ': <b>' . $this->name . '</b><br>';
            $s .= $langs->trans("Version") . ': <b>' . $this->getVersion() . '</b><br>';
        }
        //$s.='<br>';
        //$s.='<u>'.$langs->trans("ThisIsModuleRules").':</u><br>';
        $s .= '<br>';
        if ($type == 0 || $type == -1) {
            $result = $this->get_code($db, $soc, 'customer');
            $nextval = $this->code;
            if (empty($nextval)) {
                $nextval = $langs->trans("Undefined");
            }
            $s .= $langs->trans("NextValue") . ($type == -1 ? ' (' . $langs->trans("Customer") . ')' : '') . ': <b>' . $nextval . '</b><br>';
        }
        if ($type == 1 || $type == -1) {
            $result = $this->get_code($db, $soc, 'supplier');
            $nextval = $this->code;
            if (empty($nextval)) {
                $nextval = $langs->trans("Undefined");
            }
            $s .= $langs->trans("NextValue") . ($type == -1 ? ' (' . $langs->trans("Supplier") . ')' : '') . ': <b>' . $nextval . '</b>';
        }
        return $s;
    }

    // phpcs:disable PEAR.NamingConventions.ValidFunctionName.ScopeNotCamelCaps

    /**
     *  Set accountancy account code for a third party into this->code
     *
     * @param DoliDB $db Database handler
     * @param Societe $societe Third party object
     * @param string $type 'customer' or 'supplier'
     * @return int<-1,1>               >=0 if success, -1 if failure
     */
    public function get_code($db, $societe, $type = '')
    {
        // phpcs:enable
        global $langs;

        dol_syslog(get_class($this) . "::get_code" . $langs->trans("NotAvailable"), LOG_ERR);
        return -1;
    }
}
