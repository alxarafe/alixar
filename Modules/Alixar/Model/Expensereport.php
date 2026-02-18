<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class Expensereport
 * Represents table expensereport
 */
class Expensereport extends Model
{
    protected $table = 'expensereport';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'ref',
        'entity',
        'ref_number_int',
        'ref_ext',
        'total_ht',
        'total_tva',
        'localtax1',
        'localtax2',
        'total_ttc',
        'date_debut',
        'date_fin',
        'date_create',
        'date_valid',
        'date_approve',
        'date_refuse',
        'date_cancel',
        'fk_user_author',
        'fk_user_creat',
        'fk_user_modif',
        'fk_user_valid',
        'fk_user_validator',
        'fk_user_approve',
        'fk_user_refuse',
        'fk_user_cancel',
        'fk_statut',
        'fk_c_paiement',
        'paid',
        'note_public',
        'note_private',
        'detail_refuse',
        'detail_cancel',
        'integration_compta',
        'fk_bank_account',
        'model_pdf',
        'last_main_doc',
        'fk_multicurrency',
        'multicurrency_code',
        'multicurrency_tx',
        'multicurrency_total_ht',
        'multicurrency_total_tva',
        'multicurrency_total_ttc',
        'import_key',
        'extraparams',
    ];
}
