<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class Payment
 * Represents table paiement
 */
class Payment extends Model
{
    protected $table = 'paiement';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'ref',
        'ref_ext',
        'entity',
        'datec',
        'datep',
        'amount',
        'multicurrency_amount',
        'fk_paiement',
        'num_paiement',
        'note',
        'ext_payment_id',
        'ext_payment_site',
        'fk_bank',
        'fk_user_creat',
        'fk_user_modif',
        'statut',
        'fk_export_compta',
        'pos_change',
    ];
}
