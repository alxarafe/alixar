<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class AccountingBookkeeping
 * Represents table accounting_bookkeeping
 */
class AccountingBookkeeping extends Model
{
    protected $table = 'accounting_bookkeeping';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'entity',
        'piece_num',
        'doc_date',
        'doc_type',
        'doc_ref',
        'fk_doc',
        'fk_docdet',
        'thirdparty_code',
        'subledger_account',
        'subledger_label',
        'numero_compte',
        'label_compte',
        'label_operation',
        'debit',
        'credit',
        'montant',
        'sens',
        'multicurrency_amount',
        'multicurrency_code',
        'lettering_code',
        'date_lettering',
        'date_lim_reglement',
        'fk_user_author',
        'fk_user_modif',
        'date_creation',
        'fk_user',
        'code_journal',
        'journal_label',
        'date_validated',
        'date_export',
        'import_key',
        'extraparams',
    ];
}
