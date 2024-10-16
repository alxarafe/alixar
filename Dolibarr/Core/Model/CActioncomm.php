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

use Dolibarr\Core\Base\Model;

/**
 * Class CActioncomm
 *
 * @property int $id
 * @property string $code
 * @property string $type
 * @property string $libelle
 * @property string|null $module
 * @property int $active
 * @property int|null $todo
 * @property string|null $color
 * @property string|null $picto
 * @property int $position
 */
class CActioncomm extends Model
{
    public $incrementing = false;
    public $timestamps = false;
    protected $table = 'c_actioncomm';
    protected $casts = [
        'id' => 'int',
        'active' => 'int',
        'todo' => 'int',
        'position' => 'int'
    ];

    protected $fillable = [
        'code',
        'type',
        'libelle',
        'module',
        'active',
        'todo',
        'color',
        'picto',
        'position'
    ];
}
