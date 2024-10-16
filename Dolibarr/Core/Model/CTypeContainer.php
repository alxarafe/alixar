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
 * Class CTypeContainer
 *
 * @property int $rowid
 * @property string $code
 * @property int $entity
 * @property string $label
 * @property string|null $module
 * @property string|null $typecontainer
 * @property int|null $position
 * @property int $active
 */
class CTypeContainer extends Model
{
    public $timestamps = false;
    protected $table = 'c_type_container';
    protected $casts = [
        'entity' => 'int',
        'position' => 'int',
        'active' => 'int'
    ];

    protected $fillable = [
        'code',
        'entity',
        'label',
        'module',
        'typecontainer',
        'position',
        'active'
    ];
}
