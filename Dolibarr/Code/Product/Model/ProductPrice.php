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
use Illuminate\Database\Eloquent\Collection;

/**
 * Class ProductPrice
 *
 * @property int $rowid
 * @property int $entity
 * @property Carbon|null $tms
 * @property int $fk_product
 * @property Carbon $date_price
 * @property int|null $price_level
 * @property float|null $price
 * @property float|null $price_ttc
 * @property float|null $price_min
 * @property float|null $price_min_ttc
 * @property string|null $price_base_type
 * @property string|null $default_vat_code
 * @property float $tva_tx
 * @property int $recuperableonly
 * @property float|null $localtax1_tx
 * @property string $localtax1_type
 * @property float|null $localtax2_tx
 * @property string $localtax2_type
 * @property int|null $fk_user_author
 * @property string|null $price_label
 * @property int|null $tosell
 * @property int $price_by_qty
 * @property int|null $fk_price_expression
 * @property string|null $import_key
 * @property int|null $fk_multicurrency
 * @property string|null $multicurrency_code
 * @property float|null $multicurrency_tx
 * @property float|null $multicurrency_price
 * @property float|null $multicurrency_price_ttc
 *
 * @property Product $product
 * @property Collection|ProductPriceByQty[] $product_price_by_qties
 */
class ProductPrice extends Model
{
    public $timestamps = false;
    protected $table = 'product_price';
    protected $casts = [
        'entity' => 'int',
        'tms' => 'datetime',
        'fk_product' => 'int',
        'date_price' => 'datetime',
        'price_level' => 'int',
        'price' => 'float',
        'price_ttc' => 'float',
        'price_min' => 'float',
        'price_min_ttc' => 'float',
        'tva_tx' => 'float',
        'recuperableonly' => 'int',
        'localtax1_tx' => 'float',
        'localtax2_tx' => 'float',
        'fk_user_author' => 'int',
        'tosell' => 'int',
        'price_by_qty' => 'int',
        'fk_price_expression' => 'int',
        'fk_multicurrency' => 'int',
        'multicurrency_tx' => 'float',
        'multicurrency_price' => 'float',
        'multicurrency_price_ttc' => 'float'
    ];

    protected $fillable = [
        'entity',
        'tms',
        'fk_product',
        'date_price',
        'price_level',
        'price',
        'price_ttc',
        'price_min',
        'price_min_ttc',
        'price_base_type',
        'default_vat_code',
        'tva_tx',
        'recuperableonly',
        'localtax1_tx',
        'localtax1_type',
        'localtax2_tx',
        'localtax2_type',
        'fk_user_author',
        'price_label',
        'tosell',
        'price_by_qty',
        'fk_price_expression',
        'import_key',
        'fk_multicurrency',
        'multicurrency_code',
        'multicurrency_tx',
        'multicurrency_price',
        'multicurrency_price_ttc'
    ];

    public function product()
    {
        return $this->belongsTo(Product::class, 'fk_product');
    }

    public function product_price_by_qties()
    {
        return $this->hasMany(ProductPriceByQty::class, 'fk_product_price');
    }
}
