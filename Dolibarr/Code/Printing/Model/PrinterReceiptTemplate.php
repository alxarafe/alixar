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
 * Class PrinterReceiptTemplate
 *
 * @property int $rowid
 * @property string|null $name
 * @property string|null $template
 * @property int|null $entity
 */
class PrinterReceiptTemplate extends Model
{
    public $timestamps = false;
    protected $table = 'printer_receipt_template';
    protected $casts = [
        'entity' => 'int'
    ];

    protected $fillable = [
        'name',
        'template',
        'entity'
    ];
}