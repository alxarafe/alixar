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

namespace Dolibarr\Code\Workstation\Model;

use Carbon\Carbon;
use Dolibarr\Core\Base\Model;

/**
 * Class WorkstationWorkstationUsergroup
 *
 * @property int $rowid
 * @property Carbon|null $tms
 * @property int|null $fk_usergroup
 * @property int|null $fk_workstation
 */
class WorkstationWorkstationUsergroup extends Model
{
    public $timestamps = false;
    protected $table = 'workstation_workstation_usergroup';
    protected $casts = [
        'tms' => 'datetime',
        'fk_usergroup' => 'int',
        'fk_workstation' => 'int'
    ];

    protected $fillable = [
        'tms',
        'fk_usergroup',
        'fk_workstation'
    ];
}
