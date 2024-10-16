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

namespace Dolibarr\Code\Holiday\Model;

use Dolibarr\Core\Base\Model;

/**
 * Class HolidayUser
 *
 * @property int $fk_user
 * @property int $fk_type
 * @property float $nb_holiday
 */
class HolidayUser extends Model
{
    public $incrementing = false;
    public $timestamps = false;
    protected $table = 'holiday_users';
    protected $casts = [
        'fk_user' => 'int',
        'fk_type' => 'int',
        'nb_holiday' => 'float'
    ];

    protected $fillable = [
        'nb_holiday'
    ];
}
