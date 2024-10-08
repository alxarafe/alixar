<?php

/* Copyright (C) 2003-2005  Rodolphe Quiedeville        <rodolphe@quiedeville.org>
 * Copyright (C) 2004-2010  Laurent Destailleur         <eldy@users.sourceforge.net>
 * Copyright (C) 2004       Eric Seigne                 <eric.seigne@ryxeo.com>
 * Copyright (C) 2005-2012  Regis Houssin               <regis.houssin@inodbox.com>
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

namespace Dolibarr\Code\ProductBatch\Classes;

use Dolibarr\Code\Core\Classes\CommonNumRefGenerator;

/**
 *      \class      ModeleProductCode
 *      \brief      Parent class for product code generators
 */

/**
 *  \file       htdocs/core/modules/contract/modules_contract.php
 *  \ingroup    contract
 *  \brief      File with parent class for generating contracts to PDF and File of class to manage contract numbering
 */

/**
 *  Parent class to manage numbering of batch products
 */
abstract class ModeleNumRefBatch extends CommonNumRefGenerator
{
    // No overload code
}
