<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class UserEmployment
 * Represents table user_employment
 */
class UserEmployment extends Model
{
    protected $table = 'user_employment';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'entity',
        'ref',
        'ref_ext',
        'fk_user',
        'datec',
        'fk_user_creat',
        'fk_user_modif',
        'job',
        'status',
        'salary',
        'salaryextra',
        'weeklyhours',
        'dateemployment',
        'dateemploymentend',
    ];
}
