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
 * Class CFieldList
 *
 * @property int $rowid
 * @property Carbon|null $tms
 * @property string $element
 * @property int $entity
 * @property string $name
 * @property string $alias
 * @property string $title
 * @property string|null $align
 * @property int $sort
 * @property int $search
 * @property int $visible
 * @property string|null $enabled
 * @property int|null $rang
 */
class CFieldList extends Model
{
    public $timestamps = false;
    protected $table = 'c_field_list';
    protected $casts = [
        'tms' => 'datetime',
        'entity' => 'int',
        'sort' => 'int',
        'search' => 'int',
        'visible' => 'int',
        'rang' => 'int'
    ];

    protected $fillable = [
        'tms',
        'element',
        'entity',
        'name',
        'alias',
        'title',
        'align',
        'sort',
        'search',
        'visible',
        'enabled',
        'rang'
    ];
}
