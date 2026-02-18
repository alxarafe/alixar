<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class ProductFournisseurPriceLog
 * Represents table product_fournisseur_price_log
 */
class ProductFournisseurPriceLog extends Model
{
    protected $table = 'product_fournisseur_price_log';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

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
        'multicurrency_price',
    ];
}
