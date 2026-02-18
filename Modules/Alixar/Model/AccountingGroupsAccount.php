<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class AccountingGroupsAccount
 * Represents table accounting_groups_account
 */
class AccountingGroupsAccount extends Model
{
    protected $table = 'accounting_groups_account';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_accounting_account',
        'fk_c_accounting_category',
    ];
}
