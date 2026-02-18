<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class ProductAttributeValue
 * Represents table product_attribute_value
 */
class ProductAttributeValue extends Model
{
    protected $table = 'product_attribute_value';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_product_attribute',
        'ref',
        'value',
        'entity',
        'position',
    ];
}
