<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class CAvailability
 * Represents table c_availability
 */
class CAvailability extends Model
{
    protected $table = 'c_availability';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'code',
        'label',
        'type_duration',
        'qty',
        'active',
        'position',
    ];
}
