<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class ThirdPartyRib
 * Represents table societe_rib
 */
class ThirdPartyRib extends Model
{
    protected $table = 'societe_rib';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'type',
        'label',
        'fk_soc',
        'datec',
        'bank',
        'code_banque',
        'code_guichet',
        'number',
        'cle_rib',
        'bic',
        'bic_intermediate',
        'iban_prefix',
        'domiciliation',
        'proprio',
        'owner_address',
        'default_rib',
        'state_id',
        'fk_country',
        'currency_code',
        'model_pdf',
        'last_main_doc',
        'rum',
        'date_rum',
        'frstrecur',
        'last_four',
        'card_type',
        'cvn',
        'exp_date_month',
        'exp_date_year',
        'country_code',
        'approved',
        'email',
        'ending_date',
        'max_total_amount_of_all_payments',
        'preapproval_key',
        'starting_date',
        'total_amount_of_all_payments',
        'stripe_card_ref',
        'stripe_account',
        'ext_payment_site',
        'extraparams',
        'date_signature',
        'online_sign_ip',
        'online_sign_name',
        'comment',
        'ipaddress',
        'status',
        'import_key',
    ];
}
