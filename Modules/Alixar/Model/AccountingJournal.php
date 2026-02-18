<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class AccountingJournal
 * Represents table accounting_journal
 */
class AccountingJournal extends Model
{
    protected $table = 'accounting_journal';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'entity',
        'code',
        'label',
        'nature',
        'active',
    ];
}
