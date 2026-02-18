<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class ProductCustomerPriceLog
 * Represents table product_customer_price_log
 */
class ProductCustomerPriceLog extends Model
{
    protected $table = 'product_customer_price_log';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

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
        'import_key',
    ];
}
