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

namespace Dolibarr\Code\BookMarks\Model;

use Carbon\Carbon;
use Dolibarr\Core\Base\Model;

/**
 * Class Bookmark
 *
 * @property int $rowid
 * @property int $fk_user
 * @property Carbon|null $dateb
 * @property string|null $url
 * @property string|null $target
 * @property string|null $title
 * @property string|null $favicon
 * @property int|null $position
 * @property int $entity
 */
class Bookmark extends Model
{
    public $timestamps = false;
    protected $table = 'bookmark';
    protected $casts = [
        'fk_user' => 'int',
        'dateb' => 'datetime',
        'position' => 'int',
        'entity' => 'int'
    ];

    protected $fillable = [
        'fk_user',
        'dateb',
        'url',
        'target',
        'title',
        'favicon',
        'position',
        'entity'
    ];
}
