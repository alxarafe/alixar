<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class ExpensereportExtrafields
 * Represents table expensereport_extrafields
 */
class ExpensereportExtrafields extends Model
{
    protected $table = 'expensereport_extrafields';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_object',
        'import_key',
    ];
}
