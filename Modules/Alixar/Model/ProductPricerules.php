<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class ProductPricerules
 * Represents table product_pricerules
 */
class ProductPricerules extends Model
{
    protected $table = 'product_pricerules';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'level',
        'fk_level',
        'var_percent',
        'var_min_percent',
    ];
}
