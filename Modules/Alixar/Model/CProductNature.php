<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class CProductNature
 * Represents table c_product_nature
 */
class CProductNature extends Model
{
    protected $table = 'c_product_nature';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'code',
        'label',
        'active',
    ];
}
