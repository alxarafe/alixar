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
 *      \file       htdocs/core/modules/societe/modules_societe.class.php
 *      \ingroup    societe
 *      \brief      File with parent class of submodules to manage numbering and document generation
 */

/**
 *      Parent class for third parties code generators
 */
abstract class ModeleThirdPartyCode extends CommonNumRefGenerator
{
    /**
     * Constructor
     *
     * @param DoliDB $db Database object
     */
    abstract public function __construct($db);

    /**
     *  Renvoie la liste des modeles de numérotation
     *
     * @param DoliDB $dbs Database handler
     * @param integer $maxfilenamelength Max length of value to show
     * @return array|int                   List of numbers
     */
    public static function liste_modeles($dbs, $maxfilenamelength = 0)
    {
        // phpcs:enable
        $list = array();
        $sql = "";

        $resql = $dbs->query($sql);
        if ($resql) {
            $num = $dbs->num_rows($resql);
            $i = 0;
            while ($i < $num) {
                $row = $dbs->fetch_row($resql);
                $list[$row[0]] = $row[1];
                $i++;
            }
        } else {
            return -1;
        }
        return $list;
    }


    // phpcs:disable PEAR.NamingConventions.ValidFunctionName.ScopeNotCamelCaps

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
        global $conf;

        $langs->loadLangs(array("admin", "companies"));

        $strikestart = '';
        $strikeend = '';
        if (getDolGlobalString('MAIN_COMPANY_CODE_ALWAYS_REQUIRED') && !empty($this->code_null)) {
            $strikestart = '<strike>';
            $strikeend = '</strike> ' . yn(1, 1, 2) . ' (' . $langs->trans("ForcedToByAModule", $langs->transnoentities("yes")) . ')';
        }

        $s = '';
        if ($type == -1) {
            $s .= $langs->trans("Name") . ': <b>' . $this->getName($langs) . '</b><br>';
        } elseif ($type == 0) {
            $s .= $langs->trans("CustomerCodeDesc") . '<br>';
        } elseif ($type == 1) {
            $s .= $langs->trans("SupplierCodeDesc") . '<br>';
        }
        if ($type != -1) {
            $s .= $langs->trans("ValidityControledByModule") . ': <b>' . $this->getName($langs) . '</b><br>';
        }
        $s .= '<br>';
        $s .= '<u>' . $langs->trans("ThisIsModuleRules") . ':</u><br>';
        if ($type == 0) {
            $s .= $langs->trans("RequiredIfCustomer") . ': ' . $strikestart;
            $s .= yn(!$this->code_null, 1, 2) . $strikeend;
            $s .= '<br>';
        } elseif ($type == 1) {
            $s .= $langs->trans("RequiredIfSupplier") . ': ' . $strikestart;
            $s .= yn(!$this->code_null, 1, 2) . $strikeend;
            $s .= '<br>';
        } elseif ($type == -1) {
            $s .= $langs->trans("Required") . ': ' . $strikestart;
            $s .= yn(!$this->code_null, 1, 2) . $strikeend;
            $s .= '<br>';
        }
        $s .= $langs->trans("CanBeModifiedIfOk") . ': ';
        $s .= yn($this->code_modifiable, 1, 2);
        $s .= '<br>';
        $s .= $langs->trans("CanBeModifiedIfKo") . ': ' . yn($this->code_modifiable_invalide, 1, 2) . '<br>';
        $s .= $langs->trans("AutomaticCode") . ': ' . yn($this->code_auto, 1, 2) . '<br>';
        $s .= '<br>';
        if ($type == 0 || $type == -1) {
            $nextval = $this->getNextValue($soc, 0);
            if (empty($nextval)) {
                $nextval = $langs->trans("Undefined");
            }
            $s .= $langs->trans("NextValue") . ($type == -1 ? ' (' . $langs->trans("Customer") . ')' : '') . ': <b>' . $nextval . '</b><br>';
        }
        if ($type == 1 || $type == -1) {
            $nextval = $this->getNextValue($soc, 1);
            if (empty($nextval)) {
                $nextval = $langs->trans("Undefined");
            }
            $s .= $langs->trans("NextValue") . ($type == -1 ? ' (' . $langs->trans("Supplier") . ')' : '') . ': <b>' . $nextval . '</b>';
        }
        return $s;
    }

    /**
     *  Return next value available
     *
     * @param Societe|string $objsoc Object thirdparty
     * @param int $type Type
     * @return string                      Value
     */
    public function getNextValue($objsoc = '', $type = -1)
    {
        global $langs;
        return $langs->trans("Function_getNextValue_InModuleNotWorking");
    }

    // phpcs:disable PEAR.NamingConventions.ValidFunctionName.ScopeNotCamelCaps

    /**
     *   Check if mask/numbering use prefix
     *
     * @return    int     0=no, 1=yes
     */
    public function verif_prefixIsUsed()
    {
        // phpcs:enable
        return 0;
    }
}