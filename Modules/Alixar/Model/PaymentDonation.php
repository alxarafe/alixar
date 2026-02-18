<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class PaymentDonation
 * Represents table payment_donation
 */
class PaymentDonation extends Model
{
    protected $table = 'payment_donation';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_donation',
        'datec',
        'datep',
        'amount',
        'fk_typepayment',
        'num_payment',
        'note',
        'ext_payment_id',
        'ext_payment_site',
        'fk_bank',
        'fk_user_creat',
        'fk_user_modif',
    ];
}
