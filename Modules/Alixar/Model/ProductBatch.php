<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class ProductBatch
 * Represents table product_batch
 */
class ProductBatch extends Model
{
    protected $table = 'product_batch';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_product_stock',
        'eatby',
        'sellby',
        'batch',
        'qty',
        'import_key',
    ];
}
