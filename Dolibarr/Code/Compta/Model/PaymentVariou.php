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

namespace Dolibarr\Code\Compta\Model;

use Carbon\Carbon;
use Dolibarr\Core\Base\Model;

/**
 * Class PaymentVariou
 *
 * @property int $rowid
 * @property string|null $ref
 * @property string|null $num_payment
 * @property string|null $label
 * @property Carbon|null $tms
 * @property Carbon|null $datec
 * @property Carbon|null $datep
 * @property Carbon|null $datev
 * @property int $sens
 * @property float $amount
 * @property int $fk_typepayment
 * @property string|null $accountancy_code
 * @property string|null $subledger_account
 * @property int|null $fk_projet
 * @property int $entity
 * @property string|null $note
 * @property int|null $fk_bank
 * @property int|null $fk_user_author
 * @property int|null $fk_user_modif
 */
class PaymentVariou extends Model
{
    public $timestamps = false;
    protected $table = 'payment_various';
    protected $casts = [
        'tms' => 'datetime',
        'datec' => 'datetime',
        'datep' => 'datetime',
        'datev' => 'datetime',
        'sens' => 'int',
        'amount' => 'float',
        'fk_typepayment' => 'int',
        'fk_projet' => 'int',
        'entity' => 'int',
        'fk_bank' => 'int',
        'fk_user_author' => 'int',
        'fk_user_modif' => 'int'
    ];

    protected $fillable = [
        'ref',
        'num_payment',
        'label',
        'tms',
        'datec',
        'datep',
        'datev',
        'sens',
        'amount',
        'fk_typepayment',
        'accountancy_code',
        'subledger_account',
        'fk_projet',
        'entity',
        'note',
        'fk_bank',
        'fk_user_author',
        'fk_user_modif'
    ];
}
