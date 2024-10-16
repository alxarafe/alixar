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

namespace Dolibarr\Core\Model;

use Dolibarr\Core\Base\Model;

/**
 * Class CHolidayType
 *
 * @property int $rowid
 * @property string $code
 * @property string $label
 * @property int $affect
 * @property int $delay
 * @property float $newbymonth
 * @property int|null $fk_country
 * @property int $block_if_negative
 * @property int|null $sortorder
 * @property int|null $active
 */
class CHolidayType extends Model
{
    public $timestamps = false;
    protected $table = 'c_holiday_types';
    protected $casts = [
        'affect' => 'int',
        'delay' => 'int',
        'newbymonth' => 'float',
        'fk_country' => 'int',
        'block_if_negative' => 'int',
        'sortorder' => 'int',
        'active' => 'int'
    ];

    protected $fillable = [
        'code',
        'label',
        'affect',
        'delay',
        'newbymonth',
        'fk_country',
        'block_if_negative',
        'sortorder',
        'active'
    ];
}
