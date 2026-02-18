<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class BankAccountAccountExtrafields
 * Represents table bank_account_extrafields
 */
class BankAccountAccountExtrafields extends Model
{
    protected $table = 'bank_account_extrafields';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_object',
        'import_key',
    ];
}
