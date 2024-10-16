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
 * Class DefaultValue
 *
 * @property int $rowid
 * @property int $entity
 * @property string|null $type
 * @property int $user_id
 * @property string|null $page
 * @property string|null $param
 * @property string|null $value
 */
class DefaultValue extends Model
{
    public $timestamps = false;
    protected $table = 'default_values';
    protected $casts = [
        'entity' => 'int',
        'user_id' => 'int'
    ];

    protected $fillable = [
        'entity',
        'type',
        'user_id',
        'page',
        'param',
        'value'
    ];
}
