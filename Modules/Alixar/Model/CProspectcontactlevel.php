<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class CProspectcontactlevel
 * Represents table c_prospectcontactlevel
 */
class CProspectcontactlevel extends Model
{
    protected $table = 'c_prospectcontactlevel';
    protected $primaryKey = 'id';
    public $timestamps = false;

    protected $fillable = [
        'code',
        'label',
        'sortorder',
        'active',
        'module',
    ];
}
