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

namespace Dolibarr\Code\TakePos\Model;

use Dolibarr\Core\Base\Model;

/**
 * Class TakeposFloorTable
 *
 * @property int $rowid
 * @property int $entity
 * @property string|null $label
 * @property float|null $leftpos
 * @property float|null $toppos
 * @property int|null $floor
 */
class TakeposFloorTable extends Model
{
    public $timestamps = false;
    protected $table = 'takepos_floor_tables';
    protected $casts = [
        'entity' => 'int',
        'leftpos' => 'float',
        'toppos' => 'float',
        'floor' => 'int'
    ];

    protected $fillable = [
        'entity',
        'label',
        'leftpos',
        'toppos',
        'floor'
    ];
}
