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
 * Class RightsDef
 *
 * @property int $id
 * @property int $entity
 * @property string|null $libelle
 * @property string|null $module
 * @property string|null $module_origin
 * @property int $module_position
 * @property int $family_position
 * @property string|null $perms
 * @property string|null $subperms
 * @property string|null $type
 * @property int|null $bydefault
 * @property string|null $enabled
 */
class RightsDef extends Model
{
    public $incrementing = false;
    public $timestamps = false;
    protected $table = 'rights_def';
    protected $casts = [
        'id' => 'int',
        'entity' => 'int',
        'module_position' => 'int',
        'family_position' => 'int',
        'bydefault' => 'int'
    ];

    protected $fillable = [
        'libelle',
        'module',
        'module_origin',
        'module_position',
        'family_position',
        'perms',
        'subperms',
        'type',
        'bydefault',
        'enabled'
    ];
}
