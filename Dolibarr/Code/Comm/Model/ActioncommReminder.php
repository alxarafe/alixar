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

namespace Dolibarr\Code\Comm\Model;

use Carbon\Carbon;
use Dolibarr\Core\Base\Model;

/**
 * Class ActioncommReminder
 *
 * @property int $rowid
 * @property Carbon $dateremind
 * @property string $typeremind
 * @property int $fk_user
 * @property int $offsetvalue
 * @property string $offsetunit
 * @property int $status
 * @property string|null $lasterror
 * @property int $entity
 * @property int $fk_actioncomm
 * @property int|null $fk_email_template
 */
class ActioncommReminder extends Model
{
    public $timestamps = false;
    protected $table = 'actioncomm_reminder';
    protected $casts = [
        'dateremind' => 'datetime',
        'fk_user' => 'int',
        'offsetvalue' => 'int',
        'status' => 'int',
        'entity' => 'int',
        'fk_actioncomm' => 'int',
        'fk_email_template' => 'int'
    ];

    protected $fillable = [
        'dateremind',
        'typeremind',
        'fk_user',
        'offsetvalue',
        'offsetunit',
        'status',
        'lasterror',
        'entity',
        'fk_actioncomm',
        'fk_email_template'
    ];
}
