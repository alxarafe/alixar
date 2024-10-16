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
 * Class NotifyDef
 *
 * @property int $rowid
 * @property Carbon|null $tms
 * @property Carbon|null $datec
 * @property int $fk_action
 * @property int|null $fk_soc
 * @property int|null $fk_contact
 * @property int|null $fk_user
 * @property string|null $email
 * @property float|null $threshold
 * @property string|null $context
 * @property string|null $type
 */
class NotifyDef extends Model
{
    public $timestamps = false;
    protected $table = 'notify_def';
    protected $casts = [
        'tms' => 'datetime',
        'datec' => 'datetime',
        'fk_action' => 'int',
        'fk_soc' => 'int',
        'fk_contact' => 'int',
        'fk_user' => 'int',
        'threshold' => 'float'
    ];

    protected $fillable = [
        'tms',
        'datec',
        'fk_action',
        'fk_soc',
        'fk_contact',
        'fk_user',
        'email',
        'threshold',
        'context',
        'type'
    ];
}
