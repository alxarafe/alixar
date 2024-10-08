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

namespace Dolibarr\Code\Boxes\Model;

use Dolibarr\Core\Base\Model;

/**
 * Class Box
 *
 * @property int $rowid
 * @property int $entity
 * @property int $box_id
 * @property int $position
 * @property string $box_order
 * @property int $fk_user
 * @property int|null $maxline
 * @property string|null $params
 *
 * @property BoxesDef $boxes_def
 */
class Box extends Model
{
    public $timestamps = false;
    protected $table = 'boxes';
    protected $casts = [
        'entity' => 'int',
        'box_id' => 'int',
        'position' => 'int',
        'fk_user' => 'int',
        'maxline' => 'int'
    ];

    protected $fillable = [
        'entity',
        'box_id',
        'position',
        'box_order',
        'fk_user',
        'maxline',
        'params'
    ];

    public function boxes_def()
    {
        return $this->belongsTo(BoxesDef::class, 'box_id');
    }
}
