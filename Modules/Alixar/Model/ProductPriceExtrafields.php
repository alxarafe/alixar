<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class ProductPriceExtrafields
 * Represents table product_price_extrafields
 */
class ProductPriceExtrafields extends Model
{
    protected $table = 'product_price_extrafields';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_object',
        'import_key',
    ];
}
