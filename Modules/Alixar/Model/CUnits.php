<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class CUnits
 * Represents table c_units
 */
class CUnits extends Model
{
    protected $table = 'c_units';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'code',
        'sortorder',
        'scale',
        'label',
        'short_label',
        'unit_type',
        'active',
    ];
}
