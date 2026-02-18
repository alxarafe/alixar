<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class CProspectlevel
 * Represents table c_prospectlevel
 */
class CProspectlevel extends Model
{
    protected $table = 'c_prospectlevel';
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
