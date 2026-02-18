<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class PaymentFacture
 * Represents table paiement_facture
 */
class PaymentFacture extends Model
{
    protected $table = 'paiement_facture';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_paiement',
        'fk_facture',
        'amount',
        'multicurrency_code',
        'multicurrency_tx',
        'multicurrency_amount',
    ];
}
