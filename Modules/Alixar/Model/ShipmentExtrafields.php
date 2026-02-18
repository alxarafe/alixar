<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class ShipmentExtrafields
 * Represents table expedition_extrafields
 */
class ShipmentExtrafields extends Model
{
    protected $table = 'expedition_extrafields';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_object',
        'import_key',
    ];
}
