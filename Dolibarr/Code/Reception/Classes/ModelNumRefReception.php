<?php

/* Copyright (C) 2018       Quentin Vial-Gouteyron      <quentin.vial-gouteyron@atm-consulting.fr>
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

namespace Dolibarr\Code\Reception\Classes;

use Dolibarr\Code\Core\Classes\CommonNumRefGenerator;


/**
 *  \file       htdocs/core/modules/reception/modules_reception.php
 *  \ingroup    reception
 *  \brief      File that contains parent class for sending receipts models
 *              and parent class for sending receipts numbering models
 */

/**
 *  Parent Class of numbering models of sending receipts references
 */
abstract class ModelNumRefReception extends CommonNumRefGenerator
{
    // No overload code
}
