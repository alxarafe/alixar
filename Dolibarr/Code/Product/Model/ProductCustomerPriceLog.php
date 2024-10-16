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
 * Class ProductCustomerPriceLog
 *
 * @property int $rowid
 * @property int $entity
 * @property Carbon|null $datec
 * @property int $fk_product
 * @property int $fk_soc
 * @property string|null $ref_customer
 * @property float|null $price
 * @property float|null $price_ttc
 * @property float|null $price_min
 * @property float|null $price_min_ttc
 * @property string|null $price_base_type
 * @property string|null $default_vat_code
 * @property float|null $tva_tx
 * @property int $recuperableonly
 * @property float|null $localtax1_tx
 * @property string $localtax1_type
 * @property float|null $localtax2_tx
 * @property string $localtax2_type
 * @property int|null $fk_user
 * @property string|null $price_label
 * @property string|null $import_key
 */
class ProductCustomerPriceLog extends Model
{
    public $timestamps = false;
    protected $table = 'product_customer_price_log';
    protected $casts = [
        'entity' => 'int',
        'datec' => 'datetime',
        'fk_product' => 'int',
        'fk_soc' => 'int',
        'price' => 'float',
        'price_ttc' => 'float',
        'price_min' => 'float',
        'price_min_ttc' => 'float',
        'tva_tx' => 'float',
        'recuperableonly' => 'int',
        'localtax1_tx' => 'float',
        'localtax2_tx' => 'float',
        'fk_user' => 'int'
    ];

    protected $fillable = [
        'entity',
        'datec',
        'fk_product',
        'fk_soc',
        'ref_customer',
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
        'fk_user',
        'price_label',
        'import_key'
    ];
}
