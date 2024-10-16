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
 * Class UserClicktodial
 *
 * @property int $fk_user
 * @property string|null $url
 * @property string|null $login
 * @property string|null $pass
 * @property string|null $poste
 */
class UserClicktodial extends Model
{
    public $incrementing = false;
    public $timestamps = false;
    protected $table = 'user_clicktodial';
    protected $primaryKey = 'fk_user';
    protected $casts = [
        'fk_user' => 'int'
    ];

    protected $fillable = [
        'url',
        'login',
        'pass',
        'poste'
    ];
}
