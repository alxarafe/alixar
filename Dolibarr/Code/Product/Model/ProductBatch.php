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
 * Class ProductBatch
 *
 * @property int $rowid
 * @property Carbon|null $tms
 * @property int $fk_product_stock
 * @property Carbon|null $eatby
 * @property Carbon|null $sellby
 * @property string $batch
 * @property float $qty
 * @property string|null $import_key
 *
 * @property ProductStock $product_stock
 */
class ProductBatch extends Model
{
    public $timestamps = false;
    protected $table = 'product_batch';
    protected $casts = [
        'tms' => 'datetime',
        'fk_product_stock' => 'int',
        'eatby' => 'datetime',
        'sellby' => 'datetime',
        'qty' => 'float'
    ];

    protected $fillable = [
        'tms',
        'fk_product_stock',
        'eatby',
        'sellby',
        'batch',
        'qty',
        'import_key'
    ];

    public function product_stock()
    {
        return $this->belongsTo(ProductStock::class, 'fk_product_stock');
    }
}
