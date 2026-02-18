<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class ProductPrice
 * Represents table product_price
 */
class ProductPrice extends Model
{
    protected $table = 'product_price';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'entity',
        'fk_product',
        'date_price',
        'price_level',
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
        'fk_user_author',
        'price_label',
        'tosell',
        'price_by_qty',
        'fk_price_expression',
        'import_key',
        'fk_multicurrency',
        'multicurrency_code',
        'multicurrency_tx',
        'multicurrency_price',
        'multicurrency_price_ttc',
    ];
}
