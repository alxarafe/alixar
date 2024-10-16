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
use Dolibarr\Code\Categories\Model\Categorie;
use Dolibarr\Code\Contrat\Model\Contratdet;
use Dolibarr\Code\Mrp\Model\MrpProduction;
use Dolibarr\Core\Base\Model;
use Dolibarr\Core\Model\CBarcodeType;
use Dolibarr\Core\Model\CCountry;
use Dolibarr\Core\Model\CProductNature;
use Dolibarr\Core\Model\CUnit;
use Illuminate\Database\Eloquent\Collection;

/**
 * Class Product
 *
 * @property int $rowid
 * @property string $ref
 * @property int $entity
 * @property string|null $ref_ext
 * @property Carbon|null $datec
 * @property Carbon|null $tms
 * @property int|null $fk_parent
 * @property string $label
 * @property string|null $description
 * @property string|null $note_public
 * @property string|null $note
 * @property string|null $customcode
 * @property int|null $fk_country
 * @property int|null $fk_state
 * @property float|null $price
 * @property float|null $price_ttc
 * @property float|null $price_min
 * @property float|null $price_min_ttc
 * @property string|null $price_base_type
 * @property string|null $price_label
 * @property float|null $cost_price
 * @property string|null $default_vat_code
 * @property float|null $tva_tx
 * @property int $recuperableonly
 * @property float|null $localtax1_tx
 * @property string $localtax1_type
 * @property float|null $localtax2_tx
 * @property string $localtax2_type
 * @property int|null $fk_user_author
 * @property int|null $fk_user_modif
 * @property int|null $tosell
 * @property int|null $tobuy
 * @property int $tobatch
 * @property int $sell_or_eat_by_mandatory
 * @property string|null $batch_mask
 * @property int|null $fk_product_type
 * @property string|null $duration
 * @property float|null $seuil_stock_alerte
 * @property string|null $url
 * @property string|null $barcode
 * @property int|null $fk_barcode_type
 * @property string|null $accountancy_code_sell
 * @property string|null $accountancy_code_sell_intra
 * @property string|null $accountancy_code_sell_export
 * @property string|null $accountancy_code_buy
 * @property string|null $accountancy_code_buy_intra
 * @property string|null $accountancy_code_buy_export
 * @property string|null $partnumber
 * @property float|null $net_measure
 * @property int|null $net_measure_units
 * @property float|null $weight
 * @property int|null $weight_units
 * @property float|null $length
 * @property int|null $length_units
 * @property float|null $width
 * @property int|null $width_units
 * @property float|null $height
 * @property int|null $height_units
 * @property float|null $surface
 * @property int|null $surface_units
 * @property float|null $volume
 * @property int|null $volume_units
 * @property int $stockable_product
 * @property float|null $stock
 * @property float $pmp
 * @property float|null $fifo
 * @property float|null $lifo
 * @property int|null $fk_default_warehouse
 * @property int|null $fk_default_bom
 * @property int|null $fk_default_workstation
 * @property string|null $canvas
 * @property int|null $finished
 * @property int|null $lifetime
 * @property int|null $qc_frequency
 * @property int|null $hidden
 * @property string|null $import_key
 * @property string|null $model_pdf
 * @property int|null $fk_price_expression
 * @property float|null $desiredstock
 * @property int|null $fk_unit
 * @property int|null $price_autogen
 * @property int|null $fk_project
 * @property int|null $mandatory_period
 * @property string|null $last_main_doc
 *
 * @property CBarcodeType|null $c_barcode_type
 * @property Entrepot|null $entrepot
 * @property CProductNature|null $c_product_nature
 * @property CCountry|null $c_country
 * @property CUnit|null $c_unit
 * @property Collection|Categorie[] $categories
 * @property Collection|Contratdet[] $contratdets
 * @property Collection|MrpProduction[] $mrp_productions
 * @property Collection|ProductCustomerPrice[] $product_customer_prices
 * @property Collection|ProductFournisseurPrice[] $product_fournisseur_prices
 * @property Collection|ProductLang[] $product_langs
 * @property Collection|ProductPrice[] $product_prices
 * @property Collection|ProductStock[] $product_stocks
 */
class Product extends Model
{
    public $timestamps = false;
    protected $table = 'product';
    protected $casts = [
        'entity' => 'int',
        'datec' => 'datetime',
        'tms' => 'datetime',
        'fk_parent' => 'int',
        'fk_country' => 'int',
        'fk_state' => 'int',
        'price' => 'float',
        'price_ttc' => 'float',
        'price_min' => 'float',
        'price_min_ttc' => 'float',
        'cost_price' => 'float',
        'tva_tx' => 'float',
        'recuperableonly' => 'int',
        'localtax1_tx' => 'float',
        'localtax2_tx' => 'float',
        'fk_user_author' => 'int',
        'fk_user_modif' => 'int',
        'tosell' => 'int',
        'tobuy' => 'int',
        'tobatch' => 'int',
        'sell_or_eat_by_mandatory' => 'int',
        'fk_product_type' => 'int',
        'seuil_stock_alerte' => 'float',
        'fk_barcode_type' => 'int',
        'net_measure' => 'float',
        'net_measure_units' => 'int',
        'weight' => 'float',
        'weight_units' => 'int',
        'length' => 'float',
        'length_units' => 'int',
        'width' => 'float',
        'width_units' => 'int',
        'height' => 'float',
        'height_units' => 'int',
        'surface' => 'float',
        'surface_units' => 'int',
        'volume' => 'float',
        'volume_units' => 'int',
        'stockable_product' => 'int',
        'stock' => 'float',
        'pmp' => 'float',
        'fifo' => 'float',
        'lifo' => 'float',
        'fk_default_warehouse' => 'int',
        'fk_default_bom' => 'int',
        'fk_default_workstation' => 'int',
        'finished' => 'int',
        'lifetime' => 'int',
        'qc_frequency' => 'int',
        'hidden' => 'int',
        'fk_price_expression' => 'int',
        'desiredstock' => 'float',
        'fk_unit' => 'int',
        'price_autogen' => 'int',
        'fk_project' => 'int',
        'mandatory_period' => 'int'
    ];

    protected $fillable = [
        'ref',
        'entity',
        'ref_ext',
        'datec',
        'tms',
        'fk_parent',
        'label',
        'description',
        'note_public',
        'note',
        'customcode',
        'fk_country',
        'fk_state',
        'price',
        'price_ttc',
        'price_min',
        'price_min_ttc',
        'price_base_type',
        'price_label',
        'cost_price',
        'default_vat_code',
        'tva_tx',
        'recuperableonly',
        'localtax1_tx',
        'localtax1_type',
        'localtax2_tx',
        'localtax2_type',
        'fk_user_author',
        'fk_user_modif',
        'tosell',
        'tobuy',
        'tobatch',
        'sell_or_eat_by_mandatory',
        'batch_mask',
        'fk_product_type',
        'duration',
        'seuil_stock_alerte',
        'url',
        'barcode',
        'fk_barcode_type',
        'accountancy_code_sell',
        'accountancy_code_sell_intra',
        'accountancy_code_sell_export',
        'accountancy_code_buy',
        'accountancy_code_buy_intra',
        'accountancy_code_buy_export',
        'partnumber',
        'net_measure',
        'net_measure_units',
        'weight',
        'weight_units',
        'length',
        'length_units',
        'width',
        'width_units',
        'height',
        'height_units',
        'surface',
        'surface_units',
        'volume',
        'volume_units',
        'stockable_product',
        'stock',
        'pmp',
        'fifo',
        'lifo',
        'fk_default_warehouse',
        'fk_default_bom',
        'fk_default_workstation',
        'canvas',
        'finished',
        'lifetime',
        'qc_frequency',
        'hidden',
        'import_key',
        'model_pdf',
        'fk_price_expression',
        'desiredstock',
        'fk_unit',
        'price_autogen',
        'fk_project',
        'mandatory_period',
        'last_main_doc'
    ];

    public function c_barcode_type()
    {
        return $this->belongsTo(CBarcodeType::class, 'fk_barcode_type');
    }

    public function entrepot()
    {
        return $this->belongsTo(Entrepot::class, 'fk_default_warehouse');
    }

    public function c_product_nature()
    {
        return $this->belongsTo(CProductNature::class, 'finished', 'code');
    }

    public function c_country()
    {
        return $this->belongsTo(CCountry::class, 'fk_country');
    }

    public function c_unit()
    {
        return $this->belongsTo(CUnit::class, 'fk_unit');
    }

    public function categories()
    {
        return $this->belongsToMany(Categorie::class, 'alx_categorie_product', 'fk_product', 'fk_categorie')
            ->withPivot('import_key');
    }

    public function contratdets()
    {
        return $this->hasMany(Contratdet::class, 'fk_product');
    }

    public function mrp_productions()
    {
        return $this->hasMany(MrpProduction::class, 'fk_product');
    }

    public function product_customer_prices()
    {
        return $this->hasMany(ProductCustomerPrice::class, 'fk_product');
    }

    public function product_fournisseur_prices()
    {
        return $this->hasMany(ProductFournisseurPrice::class, 'fk_product');
    }

    public function product_langs()
    {
        return $this->hasMany(ProductLang::class, 'fk_product');
    }

    public function product_prices()
    {
        return $this->hasMany(ProductPrice::class, 'fk_product');
    }

    public function product_stocks()
    {
        return $this->hasMany(ProductStock::class, 'fk_product');
    }
}
