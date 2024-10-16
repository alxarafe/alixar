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
 * Class PaymentVat
 *
 * @property int $rowid
 * @property int|null $fk_tva
 * @property Carbon|null $datec
 * @property Carbon|null $tms
 * @property Carbon|null $datep
 * @property float|null $amount
 * @property int $fk_typepaiement
 * @property string|null $num_paiement
 * @property string|null $note
 * @property int $fk_bank
 * @property int|null $fk_user_creat
 * @property int|null $fk_user_modif
 */
class PaymentVat extends Model
{
    public $timestamps = false;
    protected $table = 'payment_vat';
    protected $casts = [
        'fk_tva' => 'int',
        'datec' => 'datetime',
        'tms' => 'datetime',
        'datep' => 'datetime',
        'amount' => 'float',
        'fk_typepaiement' => 'int',
        'fk_bank' => 'int',
        'fk_user_creat' => 'int',
        'fk_user_modif' => 'int'
    ];

    protected $fillable = [
        'fk_tva',
        'datec',
        'tms',
        'datep',
        'amount',
        'fk_typepaiement',
        'num_paiement',
        'note',
        'fk_bank',
        'fk_user_creat',
        'fk_user_modif'
    ];
}
