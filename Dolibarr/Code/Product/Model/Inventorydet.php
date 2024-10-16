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
 * Class Inventorydet
 *
 * @property int $rowid
 * @property Carbon|null $datec
 * @property Carbon|null $tms
 * @property int|null $fk_inventory
 * @property int|null $fk_warehouse
 * @property int|null $fk_product
 * @property string|null $batch
 * @property float|null $qty_stock
 * @property float|null $qty_view
 * @property float|null $qty_regulated
 * @property float|null $pmp_real
 * @property float|null $pmp_expected
 * @property int|null $fk_movement
 */
class Inventorydet extends Model
{
    public $timestamps = false;
    protected $table = 'inventorydet';
    protected $casts = [
        'datec' => 'datetime',
        'tms' => 'datetime',
        'fk_inventory' => 'int',
        'fk_warehouse' => 'int',
        'fk_product' => 'int',
        'qty_stock' => 'float',
        'qty_view' => 'float',
        'qty_regulated' => 'float',
        'pmp_real' => 'float',
        'pmp_expected' => 'float',
        'fk_movement' => 'int'
    ];

    protected $fillable = [
        'datec',
        'tms',
        'fk_inventory',
        'fk_warehouse',
        'fk_product',
        'batch',
        'qty_stock',
        'qty_view',
        'qty_regulated',
        'pmp_real',
        'pmp_expected',
        'fk_movement'
    ];
}
