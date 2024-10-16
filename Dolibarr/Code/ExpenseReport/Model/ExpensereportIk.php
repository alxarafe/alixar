<?php

/* Copyright (C) 2024       Rafael San José         <rsanjose@alxarafe.com>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <https://www.gnu.org/licenses/>.
 */

namespace Dolibarr\Code\ExpenseReport\Model;

use Carbon\Carbon;
use Dolibarr\Core\Base\Model;

/**
 * Class ExpensereportIk
 *
 * @property int $rowid
 * @property Carbon|null $datec
 * @property Carbon|null $tms
 * @property int $fk_c_exp_tax_cat
 * @property int $fk_range
 * @property float $coef
 * @property float $ikoffset
 * @property int|null $active
 */
class ExpensereportIk extends Model
{
    public $timestamps = false;
    protected $table = 'expensereport_ik';
    protected $casts = [
        'datec' => 'datetime',
        'tms' => 'datetime',
        'fk_c_exp_tax_cat' => 'int',
        'fk_range' => 'int',
        'coef' => 'float',
        'ikoffset' => 'float',
        'active' => 'int'
    ];

    protected $fillable = [
        'datec',
        'tms',
        'fk_c_exp_tax_cat',
        'fk_range',
        'coef',
        'ikoffset',
        'active'
    ];
}
