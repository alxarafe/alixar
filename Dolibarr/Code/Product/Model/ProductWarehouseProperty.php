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
 * Class ProductWarehouseProperty
 *
 * @property int $rowid
 * @property Carbon|null $tms
 * @property int $fk_product
 * @property int $fk_entrepot
 * @property float|null $seuil_stock_alerte
 * @property float|null $desiredstock
 * @property string|null $import_key
 */
class ProductWarehouseProperty extends Model
{
    public $timestamps = false;
    protected $table = 'product_warehouse_properties';
    protected $casts = [
        'tms' => 'datetime',
        'fk_product' => 'int',
        'fk_entrepot' => 'int',
        'seuil_stock_alerte' => 'float',
        'desiredstock' => 'float'
    ];

    protected $fillable = [
        'tms',
        'fk_product',
        'fk_entrepot',
        'seuil_stock_alerte',
        'desiredstock',
        'import_key'
    ];
}
