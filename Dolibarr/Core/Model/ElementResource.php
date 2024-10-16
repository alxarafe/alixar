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
 * Class ElementResource
 *
 * @property int $rowid
 * @property int|null $element_id
 * @property string|null $element_type
 * @property int|null $resource_id
 * @property string|null $resource_type
 * @property int|null $busy
 * @property int|null $mandatory
 * @property float|null $duree
 * @property int|null $fk_user_create
 * @property Carbon|null $tms
 */
class ElementResource extends Model
{
    public $timestamps = false;
    protected $table = 'element_resources';
    protected $casts = [
        'element_id' => 'int',
        'resource_id' => 'int',
        'busy' => 'int',
        'mandatory' => 'int',
        'duree' => 'float',
        'fk_user_create' => 'int',
        'tms' => 'datetime'
    ];

    protected $fillable = [
        'element_id',
        'element_type',
        'resource_id',
        'resource_type',
        'busy',
        'mandatory',
        'duree',
        'fk_user_create',
        'tms'
    ];
}
