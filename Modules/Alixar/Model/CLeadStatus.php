<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class CLeadStatus
 * Represents table c_lead_status
 */
class CLeadStatus extends Model
{
    protected $table = 'c_lead_status';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'code',
        'label',
        'position',
        'percent',
        'active',
    ];
}
