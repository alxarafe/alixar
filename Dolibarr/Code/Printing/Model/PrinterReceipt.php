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

use Dolibarr\Core\Base\Model;

/**
 * Class PrinterReceipt
 *
 * @property int $rowid
 * @property string|null $name
 * @property int|null $fk_type
 * @property int|null $fk_profile
 * @property string|null $parameter
 * @property int|null $entity
 */
class PrinterReceipt extends Model
{
    public $timestamps = false;
    protected $table = 'printer_receipt';
    protected $casts = [
        'fk_type' => 'int',
        'fk_profile' => 'int',
        'entity' => 'int'
    ];

    protected $fillable = [
        'name',
        'fk_type',
        'fk_profile',
        'parameter',
        'entity'
    ];
}
