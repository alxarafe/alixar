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

namespace Dolibarr\Code\Expedition\Model;

use Carbon\Carbon;
use Dolibarr\Core\Base\Model;

/**
 * Class ExpeditiondetExtrafield
 *
 * @property int $rowid
 * @property Carbon|null $tms
 * @property int $fk_object
 * @property string|null $import_key
 */
class ExpeditiondetExtrafield extends Model
{
    public $timestamps = false;
    protected $table = 'expeditiondet_extrafields';
    protected $casts = [
        'tms' => 'datetime',
        'fk_object' => 'int'
    ];

    protected $fillable = [
        'tms',
        'fk_object',
        'import_key'
    ];
}
