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

namespace Dolibarr\Code\BloquedLog\Model;

use Carbon\Carbon;
use Dolibarr\Core\Base\Model;

/**
 * Class Blockedlog
 *
 * @property int $rowid
 * @property int $entity
 * @property Carbon|null $date_creation
 * @property Carbon|null $tms
 * @property string|null $action
 * @property float $amounts
 * @property string|null $element
 * @property int|null $fk_user
 * @property string|null $user_fullname
 * @property int|null $fk_object
 * @property string|null $ref_object
 * @property Carbon|null $date_object
 * @property string $signature
 * @property string $signature_line
 * @property string|null $object_data
 * @property string|null $object_version
 * @property int|null $certified
 */
class Blockedlog extends Model
{
    public $timestamps = false;
    protected $table = 'blockedlog';
    protected $casts = [
        'entity' => 'int',
        'date_creation' => 'datetime',
        'tms' => 'datetime',
        'amounts' => 'float',
        'fk_user' => 'int',
        'fk_object' => 'int',
        'date_object' => 'datetime',
        'certified' => 'int'
    ];

    protected $fillable = [
        'entity',
        'date_creation',
        'tms',
        'action',
        'amounts',
        'element',
        'fk_user',
        'user_fullname',
        'fk_object',
        'ref_object',
        'date_object',
        'signature',
        'signature_line',
        'object_data',
        'object_version',
        'certified'
    ];
}
