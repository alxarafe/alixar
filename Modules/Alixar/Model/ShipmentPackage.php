<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class ShipmentPackage
 * Represents table expedition_package
 */
class ShipmentPackage extends Model
{
    protected $table = 'expedition_package';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_expedition',
        'description',
        'value',
        'fk_package_type',
        'height',
        'width',
        'size',
        'size_units',
        'weight',
        'weight_units',
        'dangerous_goods',
        'tail_lift',
        'rang',
    ];
}
