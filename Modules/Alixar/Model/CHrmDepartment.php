<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class CHrmDepartment
 * Represents table c_hrm_department
 */
class CHrmDepartment extends Model
{
    protected $table = 'c_hrm_department';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'pos',
        'code',
        'label',
        'active',
    ];
}
