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

use Dolibarr\Core\Base\Model;

/**
 * Class ProductAssociation
 *
 * @property int $rowid
 * @property int $fk_product_pere
 * @property int $fk_product_fils
 * @property float|null $qty
 * @property int|null $incdec
 * @property int|null $rang
 * @property string|null $import_key
 */
class ProductAssociation extends Model
{
    public $timestamps = false;
    protected $table = 'product_association';
    protected $casts = [
        'fk_product_pere' => 'int',
        'fk_product_fils' => 'int',
        'qty' => 'float',
        'incdec' => 'int',
        'rang' => 'int'
    ];

    protected $fillable = [
        'fk_product_pere',
        'fk_product_fils',
        'qty',
        'incdec',
        'rang',
        'import_key'
    ];
}
