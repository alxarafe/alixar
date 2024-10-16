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
 * Class PosCashFence
 *
 * @property int $rowid
 * @property int $entity
 * @property string|null $ref
 * @property string|null $label
 * @property float|null $opening
 * @property float|null $cash
 * @property float|null $card
 * @property float|null $cheque
 * @property int|null $status
 * @property Carbon $date_creation
 * @property Carbon|null $date_valid
 * @property int|null $day_close
 * @property int|null $month_close
 * @property int|null $year_close
 * @property string|null $posmodule
 * @property string|null $posnumber
 * @property int|null $fk_user_creat
 * @property int|null $fk_user_valid
 * @property Carbon|null $tms
 * @property string|null $import_key
 */
class PosCashFence extends Model
{
    public $timestamps = false;
    protected $table = 'pos_cash_fence';
    protected $casts = [
        'entity' => 'int',
        'opening' => 'float',
        'cash' => 'float',
        'card' => 'float',
        'cheque' => 'float',
        'status' => 'int',
        'date_creation' => 'datetime',
        'date_valid' => 'datetime',
        'day_close' => 'int',
        'month_close' => 'int',
        'year_close' => 'int',
        'fk_user_creat' => 'int',
        'fk_user_valid' => 'int',
        'tms' => 'datetime'
    ];

    protected $fillable = [
        'entity',
        'ref',
        'label',
        'opening',
        'cash',
        'card',
        'cheque',
        'status',
        'date_creation',
        'date_valid',
        'day_close',
        'month_close',
        'year_close',
        'posmodule',
        'posnumber',
        'fk_user_creat',
        'fk_user_valid',
        'tms',
        'import_key'
    ];
}
