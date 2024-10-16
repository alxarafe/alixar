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
 * Class ElementElement
 *
 * @property int $rowid
 * @property int $fk_source
 * @property string $sourcetype
 * @property int $fk_target
 * @property string $targettype
 * @property string|null $relationtype
 */
class ElementElement extends Model
{
    public $timestamps = false;
    protected $table = 'element_element';
    protected $casts = [
        'fk_source' => 'int',
        'fk_target' => 'int'
    ];

    protected $fillable = [
        'fk_source',
        'sourcetype',
        'fk_target',
        'targettype',
        'relationtype'
    ];
}
