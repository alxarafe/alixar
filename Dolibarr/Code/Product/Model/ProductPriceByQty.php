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
 * Class ProductPriceByQty
 *
 * @property int $rowid
 * @property int $fk_product_price
 * @property float|null $price
 * @property string|null $price_base_type
 * @property float|null $quantity
 * @property float $remise_percent
 * @property float $remise
 * @property float|null $unitprice
 * @property int|null $fk_user_creat
 * @property int|null $fk_user_modif
 * @property int|null $fk_multicurrency
 * @property string|null $multicurrency_code
 * @property float|null $multicurrency_tx
 * @property float|null $multicurrency_price
 * @property float|null $multicurrency_price_ttc
 * @property Carbon|null $tms
 * @property string|null $import_key
 *
 * @property ProductPrice $product_price
 */
class ProductPriceByQty extends Model
{
    public $timestamps = false;
    protected $table = 'product_price_by_qty';
    protected $casts = [
        'fk_product_price' => 'int',
        'price' => 'float',
        'quantity' => 'float',
        'remise_percent' => 'float',
        'remise' => 'float',
        'unitprice' => 'float',
        'fk_user_creat' => 'int',
        'fk_user_modif' => 'int',
        'fk_multicurrency' => 'int',
        'multicurrency_tx' => 'float',
        'multicurrency_price' => 'float',
        'multicurrency_price_ttc' => 'float',
        'tms' => 'datetime'
    ];

    protected $fillable = [
        'fk_product_price',
        'price',
        'price_base_type',
        'quantity',
        'remise_percent',
        'remise',
        'unitprice',
        'fk_user_creat',
        'fk_user_modif',
        'fk_multicurrency',
        'multicurrency_code',
        'multicurrency_tx',
        'multicurrency_price',
        'multicurrency_price_ttc',
        'tms',
        'import_key'
    ];

    public function product_price()
    {
        return $this->belongsTo(ProductPrice::class, 'fk_product_price');
    }
}
