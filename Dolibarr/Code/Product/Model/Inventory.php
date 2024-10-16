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

namespace Dolibarr\Code\Product\Model;

use Carbon\Carbon;
use Dolibarr\Core\Base\Model;

/**
 * Class Inventory
 *
 * @property int $rowid
 * @property int|null $entity
 * @property string|null $ref
 * @property Carbon|null $date_creation
 * @property Carbon|null $tms
 * @property int|null $fk_user_creat
 * @property int|null $fk_user_modif
 * @property int|null $fk_user_valid
 * @property int|null $fk_warehouse
 * @property int|null $fk_product
 * @property string|null $categories_product
 * @property int|null $status
 * @property string $title
 * @property Carbon|null $date_inventory
 * @property Carbon|null $date_validation
 * @property string|null $import_key
 */
class Inventory extends Model
{
    public $timestamps = false;
    protected $table = 'inventory';
    protected $casts = [
        'entity' => 'int',
        'date_creation' => 'datetime',
        'tms' => 'datetime',
        'fk_user_creat' => 'int',
        'fk_user_modif' => 'int',
        'fk_user_valid' => 'int',
        'fk_warehouse' => 'int',
        'fk_product' => 'int',
        'status' => 'int',
        'date_inventory' => 'datetime',
        'date_validation' => 'datetime'
    ];

    protected $fillable = [
        'entity',
        'ref',
        'date_creation',
        'tms',
        'fk_user_creat',
        'fk_user_modif',
        'fk_user_valid',
        'fk_warehouse',
        'fk_product',
        'categories_product',
        'status',
        'title',
        'date_inventory',
        'date_validation',
        'import_key'
    ];
}
