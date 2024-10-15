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
 * Class Tva
 *
 * @property int $rowid
 * @property Carbon|null $tms
 * @property Carbon|null $datec
 * @property Carbon|null $datep
 * @property Carbon|null $datev
 * @property float $amount
 * @property int|null $fk_typepayment
 * @property string|null $num_payment
 * @property string|null $label
 * @property int $entity
 * @property string|null $note
 * @property int $paye
 * @property int|null $fk_account
 * @property int|null $fk_user_creat
 * @property int|null $fk_user_modif
 * @property string|null $import_key
 */
class Tva extends Model
{
    public $timestamps = false;
    protected $table = 'tva';
    protected $casts = [
        'tms' => 'datetime',
        'datec' => 'datetime',
        'datep' => 'datetime',
        'datev' => 'datetime',
        'amount' => 'float',
        'fk_typepayment' => 'int',
        'entity' => 'int',
        'paye' => 'int',
        'fk_account' => 'int',
        'fk_user_creat' => 'int',
        'fk_user_modif' => 'int'
    ];

    protected $fillable = [
        'tms',
        'datec',
        'datep',
        'datev',
        'amount',
        'fk_typepayment',
        'num_payment',
        'label',
        'entity',
        'note',
        'paye',
        'fk_account',
        'fk_user_creat',
        'fk_user_modif',
        'import_key'
    ];
}
