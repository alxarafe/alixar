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
 * Class Notify
 *
 * @property int $rowid
 * @property Carbon|null $tms
 * @property Carbon|null $daten
 * @property int $fk_action
 * @property int|null $fk_soc
 * @property int|null $fk_contact
 * @property int|null $fk_user
 * @property string|null $type
 * @property string|null $type_target
 * @property string $objet_type
 * @property int $objet_id
 * @property string|null $email
 */
class Notify extends Model
{
    public $timestamps = false;
    protected $table = 'notify';
    protected $casts = [
        'tms' => 'datetime',
        'daten' => 'datetime',
        'fk_action' => 'int',
        'fk_soc' => 'int',
        'fk_contact' => 'int',
        'fk_user' => 'int',
        'objet_id' => 'int'
    ];

    protected $fillable = [
        'tms',
        'daten',
        'fk_action',
        'fk_soc',
        'fk_contact',
        'fk_user',
        'type',
        'type_target',
        'objet_type',
        'objet_id',
        'email'
    ];
}
