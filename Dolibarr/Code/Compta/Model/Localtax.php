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
 * Class Localtax
 *
 * @property int $rowid
 * @property int $entity
 * @property int|null $localtaxtype
 * @property Carbon|null $tms
 * @property Carbon|null $datep
 * @property Carbon|null $datev
 * @property float|null $amount
 * @property string|null $label
 * @property string|null $note
 * @property int|null $fk_bank
 * @property int|null $fk_user_creat
 * @property int|null $fk_user_modif
 */
class Localtax extends Model
{
    public $timestamps = false;
    protected $table = 'localtax';
    protected $casts = [
        'entity' => 'int',
        'localtaxtype' => 'int',
        'tms' => 'datetime',
        'datep' => 'datetime',
        'datev' => 'datetime',
        'amount' => 'float',
        'fk_bank' => 'int',
        'fk_user_creat' => 'int',
        'fk_user_modif' => 'int'
    ];

    protected $fillable = [
        'entity',
        'localtaxtype',
        'tms',
        'datep',
        'datev',
        'amount',
        'label',
        'note',
        'fk_bank',
        'fk_user_creat',
        'fk_user_modif'
    ];
}
