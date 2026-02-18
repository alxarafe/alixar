<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class ProductCustomerPriceExtrafields
 * Represents table product_customer_price_extrafields
 */
class ProductCustomerPriceExtrafields extends Model
{
    protected $table = 'product_customer_price_extrafields';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_object',
        'import_key',
    ];
}
