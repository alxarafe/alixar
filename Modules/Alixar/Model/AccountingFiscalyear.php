<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class AccountingFiscalyear
 * Represents table accounting_fiscalyear
 */
class AccountingFiscalyear extends Model
{
    protected $table = 'accounting_fiscalyear';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'label',
        'date_start',
        'date_end',
        'statut',
        'entity',
        'datec',
        'fk_user_author',
        'fk_user_modif',
    ];
}
