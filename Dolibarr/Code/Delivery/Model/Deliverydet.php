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

namespace Dolibarr\Code\Delivery\Model;

use Dolibarr\Core\Base\Model;

/**
 * Class Deliverydet
 *
 * @property int $rowid
 * @property int|null $fk_delivery
 * @property int|null $fk_origin_line
 * @property int|null $fk_product
 * @property string|null $description
 * @property float|null $qty
 * @property float|null $subprice
 * @property float|null $total_ht
 * @property int|null $rang
 *
 * @property Delivery|null $delivery
 */
class Deliverydet extends Model
{
    public $timestamps = false;
    protected $table = 'deliverydet';
    protected $casts = [
        'fk_delivery' => 'int',
        'fk_origin_line' => 'int',
        'fk_product' => 'int',
        'qty' => 'float',
        'subprice' => 'float',
        'total_ht' => 'float',
        'rang' => 'int'
    ];

    protected $fillable = [
        'fk_delivery',
        'fk_origin_line',
        'fk_product',
        'description',
        'qty',
        'subprice',
        'total_ht',
        'rang'
    ];

    public function delivery()
    {
        return $this->belongsTo(Delivery::class, 'fk_delivery');
    }
}
