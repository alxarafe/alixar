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

namespace Dolibarr\Code\MultiCurrency\Model;

use Carbon\Carbon;
use Dolibarr\Core\Base\Model;

/**
 * Class MulticurrencyRate
 *
 * @property int $rowid
 * @property Carbon|null $date_sync
 * @property float $rate
 * @property float|null $rate_indirect
 * @property int $fk_multicurrency
 * @property int|null $entity
 */
class MulticurrencyRate extends Model
{
    public $timestamps = false;
    protected $table = 'multicurrency_rate';
    protected $casts = [
        'date_sync' => 'datetime',
        'rate' => 'float',
        'rate_indirect' => 'float',
        'fk_multicurrency' => 'int',
        'entity' => 'int'
    ];

    protected $fillable = [
        'date_sync',
        'rate',
        'rate_indirect',
        'fk_multicurrency',
        'entity'
    ];
}
