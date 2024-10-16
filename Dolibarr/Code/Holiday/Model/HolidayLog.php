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

use Carbon\Carbon;
use Dolibarr\Core\Base\Model;

/**
 * Class HolidayLog
 *
 * @property int $rowid
 * @property Carbon $date_action
 * @property int $fk_user_action
 * @property int $fk_user_update
 * @property int $fk_type
 * @property string $type_action
 * @property string $prev_solde
 * @property string $new_solde
 */
class HolidayLog extends Model
{
    public $timestamps = false;
    protected $table = 'holiday_logs';
    protected $casts = [
        'date_action' => 'datetime',
        'fk_user_action' => 'int',
        'fk_user_update' => 'int',
        'fk_type' => 'int'
    ];

    protected $fillable = [
        'date_action',
        'fk_user_action',
        'fk_user_update',
        'fk_type',
        'type_action',
        'prev_solde',
        'new_solde'
    ];
}
