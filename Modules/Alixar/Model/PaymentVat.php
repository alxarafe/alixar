<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class PaymentVat
 * Represents table payment_vat
 */
class PaymentVat extends Model
{
    protected $table = 'payment_vat';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_tva',
        'datec',
        'datep',
        'amount',
        'fk_typepaiement',
        'num_paiement',
        'note',
        'fk_bank',
        'fk_user_creat',
        'fk_user_modif',
    ];
}
