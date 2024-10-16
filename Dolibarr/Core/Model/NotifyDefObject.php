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
 * Class NotifyDefObject
 *
 * @property int $id
 * @property int $entity
 * @property string|null $objet_type
 * @property int $objet_id
 * @property string|null $type_notif
 * @property Carbon|null $date_notif
 * @property int|null $user_id
 * @property string|null $moreparam
 */
class NotifyDefObject extends Model
{
    public $timestamps = false;
    protected $table = 'notify_def_object';
    protected $casts = [
        'entity' => 'int',
        'objet_id' => 'int',
        'date_notif' => 'datetime',
        'user_id' => 'int'
    ];

    protected $fillable = [
        'entity',
        'objet_type',
        'objet_id',
        'type_notif',
        'date_notif',
        'user_id',
        'moreparam'
    ];
}
