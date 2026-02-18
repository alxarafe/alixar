<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class ProductAssociation
 * Represents table product_association
 */
class ProductAssociation extends Model
{
    protected $table = 'product_association';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_product_pere',
        'fk_product_fils',
        'qty',
        'incdec',
        'rang',
        'import_key',
    ];
}
