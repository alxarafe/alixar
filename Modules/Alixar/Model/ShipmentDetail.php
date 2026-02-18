<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class ShipmentDetail
 * Represents table expeditiondet
 */
class ShipmentDetail extends Model
{
    protected $table = 'expeditiondet';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_expedition',
        'fk_element',
        'fk_elementdet',
        'element_type',
        'fk_product',
        'qty',
        'fk_unit',
        'fk_entrepot',
        'rang',
    ];
}
