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

use Carbon\Carbon;
use Dolibarr\Core\Base\Model;
use Illuminate\Database\Eloquent\Collection;

/**
 * Class BoxesDef
 *
 * @property int $rowid
 * @property string $file
 * @property int $entity
 * @property int $fk_user
 * @property Carbon|null $tms
 * @property string|null $note
 *
 * @property Collection|Box[] $boxes
 */
class BoxesDef extends Model
{
    public $timestamps = false;
    protected $table = 'boxes_def';
    protected $casts = [
        'entity' => 'int',
        'fk_user' => 'int',
        'tms' => 'datetime'
    ];

    protected $fillable = [
        'file',
        'entity',
        'fk_user',
        'tms',
        'note'
    ];

    public function boxes()
    {
        return $this->hasMany(Box::class, 'box_id');
    }
}
