<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class PaymentSalary
 * Represents table payment_salary
 */
class PaymentSalary extends Model
{
    protected $table = 'payment_salary';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'ref',
        'datec',
        'fk_user',
        'datep',
        'datev',
        'salary',
        'amount',
        'fk_projet',
        'fk_typepayment',
        'num_payment',
        'label',
        'datesp',
        'dateep',
        'entity',
        'note',
        'fk_bank',
        'fk_user_author',
        'fk_user_modif',
        'fk_salary',
    ];
}
