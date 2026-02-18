<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class CProductThirdpartyRelationType
 * Represents table c_product_thirdparty_relation_type
 */
class CProductThirdpartyRelationType extends Model
{
    protected $table = 'c_product_thirdparty_relation_type';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'code',
        'label',
        'active',
    ];
}
