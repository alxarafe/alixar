<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class CShipmentMode
 * Represents table c_shipment_mode
 */
class CShipmentMode extends Model
{
    protected $table = 'c_shipment_mode';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'entity',
        'code',
        'libelle',
        'description',
        'tracking',
        'active',
        'module',
    ];
}
