<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class Loan
 * Represents table loan (Préstamos)
 * Dolibarr: htdocs/loan/class/loan.class.php
 */
class Loan extends Model
{
    protected $table = 'loan';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'ref',
        'entity',
        'datec',
        'tms',
        'label',
        'fk_bank',
        'capital',
        'datestart',
        'dateend',
        'nbterm',
        'rate',
        'note_private',
        'note_public',
        'paid',
        'accountancy_account_capital',
        'accountancy_account_insurance',
        'accountancy_account_interest',
        'fk_projet',
        'fk_user_author',
        'fk_user_modif',
        'active',
        'import_key',
    ];
}
