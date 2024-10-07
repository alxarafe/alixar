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

namespace Dolibarr\Code\Variants\Model;

use Dolibarr\Core\Base\Model;

/**
 * Class ProductAttributeCombinationPriceLevel
 * Before if was ProductCombinationLevel class
 *
 * @property int $rowid
 * @property int $fk_product_attribute_combination
 * @property int $fk_price_level
 * @property float $variation_price
 * @property int|null $variation_price_percentage
 */
class ProductAttributeCombinationPriceLevel extends Model
{
    public $timestamps = false;
    protected $table = 'product_attribute_combination_price_level';
    protected $casts = [
        'fk_product_attribute_combination' => 'int',
        'fk_price_level' => 'int',
        'variation_price' => 'float',
        'variation_price_percentage' => 'int'
    ];

    protected $fillable = [
        'fk_product_attribute_combination',
        'fk_price_level',
        'variation_price',
        'variation_price_percentage'
    ];
}
