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
 * Class ProductAttributeCombination2val
 * Before if was ProductCombination2ValuePair class
 *
 * @property int $rowid
 * @property int $fk_prod_combination
 * @property int $fk_prod_attr
 * @property int $fk_prod_attr_val
 */
class ProductAttributeCombination2val extends Model
{
    public $timestamps = false;
    protected $table = 'product_attribute_combination2val';
    protected $casts = [
        'fk_prod_combination' => 'int',
        'fk_prod_attr' => 'int',
        'fk_prod_attr_val' => 'int'
    ];

    protected $fillable = [
        'fk_prod_combination',
        'fk_prod_attr',
        'fk_prod_attr_val'
    ];
}
