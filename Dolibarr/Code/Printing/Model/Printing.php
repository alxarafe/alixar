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

namespace Dolibarr\Code\Printing\Model;

use Carbon\Carbon;
use Dolibarr\Core\Base\Model;

/**
 * Class Printing
 *
 * @property int $rowid
 * @property Carbon|null $tms
 * @property Carbon|null $datec
 * @property string $printer_name
 * @property string $printer_location
 * @property string $printer_id
 * @property int $copy
 * @property string $module
 * @property string $driver
 * @property int|null $userid
 */
class Printing extends Model
{
    public $timestamps = false;
    protected $table = 'printing';
    protected $casts = [
        'tms' => 'datetime',
        'datec' => 'datetime',
        'copy' => 'int',
        'userid' => 'int'
    ];

    protected $fillable = [
        'tms',
        'datec',
        'printer_name',
        'printer_location',
        'printer_id',
        'copy',
        'module',
        'driver',
        'userid'
    ];
}
