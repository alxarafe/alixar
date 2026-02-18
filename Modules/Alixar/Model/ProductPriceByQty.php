<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class ProductPriceByQty
 * Represents table product_price_by_qty
 */
class ProductPriceByQty extends Model
{
    protected $table = 'product_price_by_qty';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_product_price',
        'price',
        'price_base_type',
        'quantity',
        'remise_percent',
        'remise',
        'unitprice',
        'fk_user_creat',
        'fk_user_modif',
        'fk_multicurrency',
        'multicurrency_code',
        'multicurrency_tx',
        'multicurrency_price',
        'multicurrency_price_ttc',
        'import_key',
    ];
}
