<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class ShipmentDetailBatch
 * Represents table expeditiondet_batch
 */
class ShipmentDetailBatch extends Model
{
    protected $table = 'expeditiondet_batch';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_expeditiondet',
        'eatby',
        'sellby',
        'batch',
        'qty',
        'fk_origin_stock',
        'fk_warehouse',
    ];
}
