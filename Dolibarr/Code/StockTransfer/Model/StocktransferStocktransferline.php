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

namespace Dolibarr\Code\StockTransfer\Model;

use Dolibarr\Core\Base\Model;

/**
 * Class StocktransferStocktransferline
 *
 * @property int $rowid
 * @property float|null $amount
 * @property float|null $qty
 * @property int $fk_warehouse_source
 * @property int $fk_warehouse_destination
 * @property int $fk_stocktransfer
 * @property int $fk_product
 * @property string|null $batch
 * @property float|null $pmp
 * @property int|null $rang
 * @property int|null $fk_parent_line
 */
class StocktransferStocktransferline extends Model
{
    public $timestamps = false;
    protected $table = 'stocktransfer_stocktransferline';
    protected $casts = [
        'amount' => 'float',
        'qty' => 'float',
        'fk_warehouse_source' => 'int',
        'fk_warehouse_destination' => 'int',
        'fk_stocktransfer' => 'int',
        'fk_product' => 'int',
        'pmp' => 'float',
        'rang' => 'int',
        'fk_parent_line' => 'int'
    ];

    protected $fillable = [
        'amount',
        'qty',
        'fk_warehouse_source',
        'fk_warehouse_destination',
        'fk_stocktransfer',
        'fk_product',
        'batch',
        'pmp',
        'rang',
        'fk_parent_line'
    ];
}
