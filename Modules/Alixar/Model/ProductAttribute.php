<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class ProductAttribute
 * Represents table product_attribute
 */
class ProductAttribute extends Model
{
    protected $table = 'product_attribute';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'ref',
        'ref_ext',
        'label',
        'position',
        'entity',
    ];
}
