<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class ReceptionDetailBatch
 * Represents table receptiondet_batch
 */
class ReceptionDetailBatch extends Model
{
    protected $table = 'receptiondet_batch';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_reception',
        'fk_element',
        'fk_elementdet',
        'element_type',
        'fk_product',
        'qty',
        'fk_entrepot',
        'fk_projet',
        'comment',
        'batch',
        'eatby',
        'sellby',
        'status',
        'fk_user',
        'datec',
        'cost_price',
    ];
}
