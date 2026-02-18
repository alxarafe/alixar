<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class ShipmentDetailExtrafields
 * Represents table expeditiondet_extrafields
 */
class ShipmentDetailExtrafields extends Model
{
    protected $table = 'expeditiondet_extrafields';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_object',
        'import_key',
    ];
}
