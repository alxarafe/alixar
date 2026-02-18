<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class BankAccountExtrafields
 * Represents table bank_extrafields
 */
class BankAccountExtrafields extends Model
{
    protected $table = 'bank_extrafields';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_object',
        'import_key',
    ];
}
