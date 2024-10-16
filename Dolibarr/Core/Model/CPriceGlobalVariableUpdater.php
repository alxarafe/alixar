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
 * Class CPriceGlobalVariableUpdater
 *
 * @property int $rowid
 * @property int $type
 * @property string|null $description
 * @property string|null $parameters
 * @property int $fk_variable
 * @property int|null $update_interval
 * @property int|null $next_update
 * @property string|null $last_status
 */
class CPriceGlobalVariableUpdater extends Model
{
    public $timestamps = false;
    protected $table = 'c_price_global_variable_updater';
    protected $casts = [
        'type' => 'int',
        'fk_variable' => 'int',
        'update_interval' => 'int',
        'next_update' => 'int'
    ];

    protected $fillable = [
        'type',
        'description',
        'parameters',
        'fk_variable',
        'update_interval',
        'next_update',
        'last_status'
    ];
}
