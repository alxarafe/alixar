<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class CShipmentPackageType
 * Represents table c_shipment_package_type
 */
class CShipmentPackageType extends Model
{
    protected $table = 'c_shipment_package_type';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'label',
        'description',
        'active',
        'entity',
    ];
}
