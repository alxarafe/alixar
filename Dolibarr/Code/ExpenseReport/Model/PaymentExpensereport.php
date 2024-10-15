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
 * Class PaymentExpensereport
 *
 * @property int $rowid
 * @property int|null $fk_expensereport
 * @property Carbon|null $datec
 * @property Carbon|null $tms
 * @property Carbon|null $datep
 * @property float|null $amount
 * @property int $fk_typepayment
 * @property string|null $num_payment
 * @property string|null $note
 * @property int $fk_bank
 * @property int|null $fk_user_creat
 * @property int|null $fk_user_modif
 */
class PaymentExpensereport extends Model
{
    public $timestamps = false;
    protected $table = 'payment_expensereport';
    protected $casts = [
        'fk_expensereport' => 'int',
        'datec' => 'datetime',
        'tms' => 'datetime',
        'datep' => 'datetime',
        'amount' => 'float',
        'fk_typepayment' => 'int',
        'fk_bank' => 'int',
        'fk_user_creat' => 'int',
        'fk_user_modif' => 'int'
    ];

    protected $fillable = [
        'fk_expensereport',
        'datec',
        'tms',
        'datep',
        'amount',
        'fk_typepayment',
        'num_payment',
        'note',
        'fk_bank',
        'fk_user_creat',
        'fk_user_modif'
    ];
}
