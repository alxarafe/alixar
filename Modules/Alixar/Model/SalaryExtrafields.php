<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class SalaryExtrafields
 * Represents table salary_extrafields
 */
class SalaryExtrafields extends Model
{
    protected $table = 'salary_extrafields';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_object',
        'import_key',
    ];
}
