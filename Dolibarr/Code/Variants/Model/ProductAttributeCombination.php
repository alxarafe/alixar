<?php

/* Copyright (C) 2024       Rafael San José         <rsanjose@alxarafe.com>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
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
 * Class ProductAttributeCombination
 *
 * @property int $rowid
 * @property int $fk_product_parent
 * @property int $fk_product_child
 * @property float $variation_price
 * @property int|null $variation_price_percentage
 * @property float $variation_weight
 * @property string|null $variation_ref_ext
 * @property int $entity
 *
 * @package App\Models
 */
class ProductAttributeCombination extends Model
{
    public $timestamps = false;

    protected $table = 'product_attribute_combination';

    protected $casts = [
        'fk_product_parent' => 'int',
        'fk_product_child' => 'int',
        'variation_price' => 'float',
        'variation_price_percentage' => 'int',
        'variation_weight' => 'float',
        'entity' => 'int'
    ];

    protected $fillable = [
        'fk_product_parent',
        'fk_product_child',
        'variation_price',
        'variation_price_percentage',
        'variation_weight',
        'variation_ref_ext',
        'entity'
    ];
}
