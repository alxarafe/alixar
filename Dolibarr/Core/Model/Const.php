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

use Carbon\Carbon;

/**
 * Class Const
 *
 * @property int $rowid
 * @property string $name
 * @property int $entity
 * @property string $value
 * @property string|null $type
 * @property int $visible
 * @property string|null $note
 * @property Carbon|null $tms
 */
class const extends Model
{
    public
    $timestamps = false;
    protected
    $table = 'const';
    protected
    $primaryKey = 'rowid';
    protected
    $casts = [
        'entity' => 'int',
        'visible' => 'int',
        'tms' => 'datetime'
    ];

    protected
    $fillable = [
        'name',
        'entity',
        'value',
        'type',
        'visible',
        'note',
        'tms'
    ];
}
