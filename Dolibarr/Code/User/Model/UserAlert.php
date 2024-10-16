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
 * Class UserAlert
 *
 * @property int $rowid
 * @property int|null $type
 * @property int|null $fk_contact
 * @property int|null $fk_user
 */
class UserAlert extends Model
{
    public $timestamps = false;
    protected $table = 'user_alert';
    protected $casts = [
        'type' => 'int',
        'fk_contact' => 'int',
        'fk_user' => 'int'
    ];

    protected $fillable = [
        'type',
        'fk_contact',
        'fk_user'
    ];
}
