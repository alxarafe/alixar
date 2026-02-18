<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class PaymentVarious
 * Represents table payment_various
 */
class PaymentVarious extends Model
{
    protected $table = 'payment_various';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'ref',
        'num_payment',
        'label',
        'datec',
        'datep',
        'datev',
        'sens',
        'amount',
        'fk_typepayment',
        'accountancy_code',
        'subledger_account',
        'fk_projet',
        'entity',
        'note',
        'fk_bank',
        'fk_user_author',
        'fk_user_modif',
    ];
}
