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

use Carbon\Carbon;
use Dolibarr\Core\Base\Model;

/**
 * Class Event
 *
 * @property int $rowid
 * @property Carbon|null $tms
 * @property string $type
 * @property int $entity
 * @property string|null $prefix_session
 * @property Carbon|null $dateevent
 * @property int|null $fk_user
 * @property string $description
 * @property string $ip
 * @property string|null $user_agent
 * @property int|null $fk_object
 * @property string|null $authentication_method
 * @property int|null $fk_oauth_token
 */
class Event extends Model
{
    public $timestamps = false;
    protected $table = 'events';
    protected $casts = [
        'tms' => 'datetime',
        'entity' => 'int',
        'dateevent' => 'datetime',
        'fk_user' => 'int',
        'fk_object' => 'int',
        'fk_oauth_token' => 'int'
    ];

    protected $hidden = [
        'fk_oauth_token'
    ];

    protected $fillable = [
        'tms',
        'type',
        'entity',
        'prefix_session',
        'dateevent',
        'fk_user',
        'description',
        'ip',
        'user_agent',
        'fk_object',
        'authentication_method',
        'fk_oauth_token'
    ];
}
