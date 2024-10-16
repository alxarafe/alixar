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
 * Class ExpensereportRule
 *
 * @property int $rowid
 * @property Carbon|null $datec
 * @property Carbon|null $tms
 * @property Carbon $dates
 * @property Carbon $datee
 * @property float $amount
 * @property int $restrictive
 * @property int|null $fk_user
 * @property int|null $fk_usergroup
 * @property int $fk_c_type_fees
 * @property string $code_expense_rules_type
 * @property int|null $is_for_all
 * @property int|null $entity
 */
class ExpensereportRule extends Model
{
    public $timestamps = false;
    protected $table = 'expensereport_rules';
    protected $casts = [
        'datec' => 'datetime',
        'tms' => 'datetime',
        'dates' => 'datetime',
        'datee' => 'datetime',
        'amount' => 'float',
        'restrictive' => 'int',
        'fk_user' => 'int',
        'fk_usergroup' => 'int',
        'fk_c_type_fees' => 'int',
        'is_for_all' => 'int',
        'entity' => 'int'
    ];

    protected $fillable = [
        'datec',
        'tms',
        'dates',
        'datee',
        'amount',
        'restrictive',
        'fk_user',
        'fk_usergroup',
        'fk_c_type_fees',
        'code_expense_rules_type',
        'is_for_all',
        'entity'
    ];
}
