<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class PaymentLoan
 * Represents table payment_loan
 */
class PaymentLoan extends Model
{
    protected $table = 'payment_loan';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_loan',
        'datec',
        'datep',
        'amount_capital',
        'amount_insurance',
        'amount_interest',
        'fk_typepayment',
        'num_payment',
        'note_private',
        'note_public',
        'fk_bank',
        'fk_user_creat',
        'fk_user_modif',
    ];
}
