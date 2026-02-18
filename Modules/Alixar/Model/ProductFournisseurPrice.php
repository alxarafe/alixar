<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class ProductFournisseurPrice
 * Represents table product_fournisseur_price
 */
class ProductFournisseurPrice extends Model
{
    protected $table = 'product_fournisseur_price';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'entity',
        'datec',
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
        'status',
    ];
}
