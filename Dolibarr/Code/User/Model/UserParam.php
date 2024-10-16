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

namespace Dolibarr\Code\User\Model;

use Dolibarr\Core\Base\Model;

/**
 * Class UserParam
 *
 * @property int $fk_user
 * @property int $entity
 * @property string $param
 * @property string $value
 */
class UserParam extends Model
{
    public $incrementing = false;
    public $timestamps = false;
    protected $table = 'user_param';
    protected $casts = [
        'fk_user' => 'int',
        'entity' => 'int'
    ];

    protected $fillable = [
        'value'
    ];
}
