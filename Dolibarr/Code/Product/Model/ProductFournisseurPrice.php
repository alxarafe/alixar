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
use Dolibarr\Code\User\Model\User;
use Dolibarr\Core\Base\Model;
use Dolibarr\Core\Model\CBarcodeType;

/**
 * Class ProductFournisseurPrice
 *
 * @property int $rowid
 * @property int $entity
 * @property Carbon|null $datec
 * @property Carbon|null $tms
 * @property int|null $fk_product
 * @property int|null $fk_soc
 * @property string|null $ref_fourn
 * @property string|null $desc_fourn
 * @property int|null $fk_availability
 * @property float|null $price
 * @property float|null $quantity
 * @property float $remise_percent
 * @property float $remise
 * @property float|null $unitprice
 * @property float|null $charges
 * @property string|null $default_vat_code
 * @property string|null $barcode
 * @property int|null $fk_barcode_type
 * @property float $tva_tx
 * @property float|null $localtax1_tx
 * @property string $localtax1_type
 * @property float|null $localtax2_tx
 * @property string $localtax2_type
 * @property int $info_bits
 * @property int|null $fk_user
 * @property int|null $fk_supplier_price_expression
 * @property int|null $delivery_time_days
 * @property string|null $supplier_reputation
 * @property float|null $packaging
 * @property int|null $fk_multicurrency
 * @property string|null $multicurrency_code
 * @property float|null $multicurrency_tx
 * @property float|null $multicurrency_unitprice
 * @property float|null $multicurrency_price
 * @property string|null $import_key
 * @property int|null $status
 *
 * @property CBarcodeType|null $c_barcode_type
 * @property Product|null $product
 * @property User|null $user
 */
class ProductFournisseurPrice extends Model
{
    public $timestamps = false;
    protected $table = 'product_fournisseur_price';
    protected $casts = [
        'entity' => 'int',
        'datec' => 'datetime',
        'tms' => 'datetime',
        'fk_product' => 'int',
        'fk_soc' => 'int',
        'fk_availability' => 'int',
        'price' => 'float',
        'quantity' => 'float',
        'remise_percent' => 'float',
        'remise' => 'float',
        'unitprice' => 'float',
        'charges' => 'float',
        'fk_barcode_type' => 'int',
        'tva_tx' => 'float',
        'localtax1_tx' => 'float',
        'localtax2_tx' => 'float',
        'info_bits' => 'int',
        'fk_user' => 'int',
        'fk_supplier_price_expression' => 'int',
        'delivery_time_days' => 'int',
        'packaging' => 'float',
        'fk_multicurrency' => 'int',
        'multicurrency_tx' => 'float',
        'multicurrency_unitprice' => 'float',
        'multicurrency_price' => 'float',
        'status' => 'int'
    ];

    protected $fillable = [
        'entity',
        'datec',
        'tms',
        'fk_product',
        'fk_soc',
        'ref_fourn',
        'desc_fourn',
        'fk_availability',
        'price',
        'quantity',
        'remise_percent',
        'remise',
        'unitprice',
        'charges',
        'default_vat_code',
        'barcode',
        'fk_barcode_type',
        'tva_tx',
        'localtax1_tx',
        'localtax1_type',
        'localtax2_tx',
        'localtax2_type',
        'info_bits',
        'fk_user',
        'fk_supplier_price_expression',
        'delivery_time_days',
        'supplier_reputation',
        'packaging',
        'fk_multicurrency',
        'multicurrency_code',
        'multicurrency_tx',
        'multicurrency_unitprice',
        'multicurrency_price',
        'import_key',
        'status'
    ];

    public function c_barcode_type()
    {
        return $this->belongsTo(CBarcodeType::class, 'fk_barcode_type');
    }

    public function product()
    {
        return $this->belongsTo(Product::class, 'fk_product');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'fk_user');
    }
}
