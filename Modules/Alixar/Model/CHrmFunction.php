<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class CHrmFunction
 * Represents table c_hrm_function
 */
class CHrmFunction extends Model
{
    protected $table = 'c_hrm_function';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'pos',
        'code',
        'label',
        'c_level',
        'active',
    ];
}
