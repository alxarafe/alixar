<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class ProductStock
 * Represents table product_stock
 */
class ProductStock extends Model
{
    protected $table = 'product_stock';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_product',
        'fk_entrepot',
        'reel',
        'import_key',
    ];
}
