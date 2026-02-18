<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class AccountingAccount
 * Represents table accounting_account
 */
class AccountingAccount extends Model
{
    protected $table = 'accounting_account';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'entity',
        'datec',
        'fk_pcg_version',
        'pcg_type',
        'account_number',
        'account_parent',
        'label',
        'labelshort',
        'fk_accounting_category',
        'fk_user_author',
        'fk_user_modif',
        'active',
        'reconcilable',
        'import_key',
        'extraparams',
    ];
}
