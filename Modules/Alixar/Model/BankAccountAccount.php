<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class BankAccountAccount
 * Represents table bank_account
 */
class BankAccountAccount extends Model
{
    protected $table = 'bank_account';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'datec',
        'ref',
        'label',
        'entity',
        'fk_user_author',
        'fk_user_modif',
        'bank',
        'code_banque',
        'code_guichet',
        'number',
        'cle_rib',
        'bic',
        'bic_intermediate',
        'iban_prefix',
        'country_iban',
        'cle_iban',
        'domiciliation',
        'pti_in_ctti',
        'state_id',
        'fk_pays',
        'proprio',
        'owner_address',
        'owner_zip',
        'owner_town',
        'owner_country_id',
        'courant',
        'clos',
        'rappro',
        'url',
        'account_number',
        'fk_accountancy_journal',
        'currency_code',
        'min_allowed',
        'min_desired',
        'comment',
        'note_public',
        'model_pdf',
        'import_key',
        'extraparams',
        'ics',
        'ics_transfer',
    ];
}
