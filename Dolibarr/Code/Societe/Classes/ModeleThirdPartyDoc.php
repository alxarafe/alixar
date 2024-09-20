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

use Dolibarr\Code\Core\Classes\CommonDocGenerator;
use DoliDB;

/**
 *      \file       htdocs/core/modules/societe/modules_societe.class.php
 *      \ingroup    societe
 *      \brief      File with parent class of submodules to manage numbering and document generation
 */

/**
 *  Parent class for third parties models of doc generators
 */
abstract class ModeleThirdPartyDoc extends CommonDocGenerator
{
    // phpcs:disable PEAR.NamingConventions.ValidFunctionName.ScopeNotCamelCaps
    /**
     *  Return list of active generation modules
     *
     * @param DoliDB $dbs Database handler
     * @param integer $maxfilenamelength Max length of value to show
     * @return array                           List of templates
     */
    public static function liste_modeles($dbs, $maxfilenamelength = 0)
    {
        // phpcs:enable
        $type = 'company';
        $list = array();

        include_once DOL_DOCUMENT_ROOT . '/core/lib/functions2.lib.php';
        $list = getListOfModels($dbs, $type, $maxfilenamelength);

        return $list;
    }
}
