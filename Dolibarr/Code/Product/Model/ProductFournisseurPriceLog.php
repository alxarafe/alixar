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
 * Class ProductFournisseurPriceLog
 *
 * @property int $rowid
 * @property Carbon|null $datec
 * @property int $fk_product_fournisseur
 * @property float|null $price
 * @property float|null $quantity
 * @property int|null $fk_user
 * @property int|null $fk_multicurrency
 * @property string|null $multicurrency_code
 * @property float|null $multicurrency_tx
 * @property float|null $multicurrency_unitprice
 * @property float|null $multicurrency_price
 */
class ProductFournisseurPriceLog extends Model
{
    public $timestamps = false;
    protected $table = 'product_fournisseur_price_log';
    protected $casts = [
        'datec' => 'datetime',
        'fk_product_fournisseur' => 'int',
        'price' => 'float',
        'quantity' => 'float',
        'fk_user' => 'int',
        'fk_multicurrency' => 'int',
        'multicurrency_tx' => 'float',
        'multicurrency_unitprice' => 'float',
        'multicurrency_price' => 'float'
    ];

    protected $fillable = [
        'datec',
        'fk_product_fournisseur',
        'price',
        'quantity',
        'fk_user',
        'fk_multicurrency',
        'multicurrency_code',
        'multicurrency_tx',
        'multicurrency_unitprice',
        'multicurrency_price'
    ];
}
