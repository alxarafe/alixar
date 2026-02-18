<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class PaymentExpensereport
 * Represents table payment_expensereport
 */
class PaymentExpensereport extends Model
{
    protected $table = 'payment_expensereport';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_expensereport',
        'datec',
        'datep',
        'amount',
        'fk_typepayment',
        'num_payment',
        'note',
        'fk_bank',
        'fk_user_creat',
        'fk_user_modif',
    ];
}
