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
 * Class ProductAttributeValue
 *
 * @property int $rowid
 * @property int $fk_product_attribute
 * @property string $ref
 * @property string $value
 * @property int $entity
 * @property int $position
 */
class ProductAttributeValue extends Model
{
    public $timestamps = false;
    protected $table = 'product_attribute_value';
    protected $casts = [
        'fk_product_attribute' => 'int',
        'entity' => 'int',
        'position' => 'int'
    ];

    protected $fillable = [
        'fk_product_attribute',
        'ref',
        'value',
        'entity',
        'position'
    ];
}
