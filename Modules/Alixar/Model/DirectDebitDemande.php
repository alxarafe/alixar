<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class DirectDebitDemande
 * Represents table prelevement_demande
 */
class DirectDebitDemande extends Model
{
    protected $table = 'prelevement_demande';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'entity',
        'fk_facture',
        'fk_facture_fourn',
        'fk_salary',
        'sourcetype',
        'amount',
        'date_demande',
        'traite',
        'date_traite',
        'fk_prelevement_bons',
        'fk_user_demande',
        'fk_societe_rib',
        'code_banque',
        'code_guichet',
        'number',
        'cle_rib',
        'type',
        'ext_payment_id',
        'ext_payment_site',
    ];
}
