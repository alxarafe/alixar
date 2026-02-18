<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class Deliverydet
 * Represents table deliverydet
 */
class Deliverydet extends Model
{
    protected $table = 'deliverydet';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_delivery',
        'fk_origin_line',
        'fk_product',
        'description',
        'qty',
        'subprice',
        'subprice_ttc',
        'total_ht',
        'rang',
    ];
}
