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
use Dolibarr\Core\Base\Model;

/**
 * Class Onlinesignature
 *
 * @property int $rowid
 * @property int $entity
 * @property string $object_type
 * @property int $object_id
 * @property Carbon $datec
 * @property Carbon|null $tms
 * @property string $name
 * @property string|null $ip
 * @property string|null $pathoffile
 */
class Onlinesignature extends Model
{
    public $timestamps = false;
    protected $table = 'onlinesignature';
    protected $casts = [
        'entity' => 'int',
        'object_id' => 'int',
        'datec' => 'datetime',
        'tms' => 'datetime'
    ];

    protected $fillable = [
        'entity',
        'object_type',
        'object_id',
        'datec',
        'tms',
        'name',
        'ip',
        'pathoffile'
    ];
}
