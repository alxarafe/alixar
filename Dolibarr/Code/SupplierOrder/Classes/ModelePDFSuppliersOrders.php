<?php

/* Copyright (C) 2003-2004  Rodolphe Quiedeville        <rodolphe@quiedeville.org>
 * Copyright (C) 2004-2005  Laurent Destailleur         <eldy@users.sourceforge.net>
 * Copyright (C) 2004       Eric Seigne                 <eric.seigne@ryxeo.com>
 * Copyright (C) 2005-2012  Regis Houssin               <regis.houssin@inodbox.com>
 * Copyright (C) 2006       Andre Cianfarani            <acianfa@free.fr>
 * Copyright (C) 2011-2016  Philippe Grand              <philippe.grand@atoo-net.com>
 * Copyright (C) 2014       Marcos García               <marcosgdf@gmail.com>
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

namespace Dolibarr\Code\SupplierOrder\Classes;

use Dolibarr\Code\Core\Classes\CommonDocGenerator;
use DoliDB;

/**
 *      \file       htdocs/core/modules/supplier_order/modules_commandefournisseur.php
 *      \ingroup    order fournisseur
 *      \brief      File that contains parent class for supplier orders models
 *                  and parent class for supplier orders numbering models
 */

/**
 *  Parent class for supplier orders models
 */
abstract class ModelePDFSuppliersOrders extends CommonDocGenerator
{
    public $posxpicture;
    public $posxtva;
    public $posxup;
    public $posxqty;
    public $posxunit;
    public $posxdesc;
    public $posxdiscount;
    public $postotalht;

    public $tva;
    public $tva_array;
    public $localtax1;
    public $localtax2;

    public $atleastoneratenotnull = 0;
    public $atleastonediscount = 0;

    // phpcs:disable PEAR.NamingConventions.ValidFunctionName.ScopeNotCamelCaps

    /**
     *  Return list of active generation models
     *
     * @param DoliDB $db Database handler
     * @param integer $maxfilenamelength Max length of value to show
     * @return array                       List of templates
     */
    public static function liste_modeles($db, $maxfilenamelength = 0)
    {
        // phpcs:enable
        $type = 'order_supplier';
        $list = array();

        include_once DOL_DOCUMENT_ROOT . '/core/lib/functions2.lib.php';
        $list = getListOfModels($db, $type, $maxfilenamelength);

        return $list;
    }
}
