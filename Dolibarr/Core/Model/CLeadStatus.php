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
 * Class CLeadStatus
 *
 * @property int $rowid
 * @property string|null $code
 * @property string|null $label
 * @property int|null $position
 * @property float|null $percent
 * @property int $active
 */
class CLeadStatus extends Model
{
    public $timestamps = false;
    protected $table = 'c_lead_status';
    protected $casts = [
        'position' => 'int',
        'percent' => 'float',
        'active' => 'int'
    ];

    protected $fillable = [
        'code',
        'label',
        'position',
        'percent',
        'active'
    ];
}
