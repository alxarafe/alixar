<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class DeliveryExtrafields
 * Represents table delivery_extrafields
 */
class DeliveryExtrafields extends Model
{
    protected $table = 'delivery_extrafields';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_object',
        'import_key',
    ];
}
