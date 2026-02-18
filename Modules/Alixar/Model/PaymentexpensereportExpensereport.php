<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class PaymentexpensereportExpensereport
 * Represents table paymentexpensereport_expensereport
 */
class PaymentexpensereportExpensereport extends Model
{
    protected $table = 'paymentexpensereport_expensereport';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_payment',
        'fk_expensereport',
        'amount',
        'multicurrency_code',
        'multicurrency_tx',
        'multicurrency_amount',
    ];
}
