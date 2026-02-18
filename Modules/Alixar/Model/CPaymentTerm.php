<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class CPaymentTerm
 * Represents table c_payment_term
 */
class CPaymentTerm extends Model
{
    protected $table = 'c_payment_term';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'entity',
        'code',
        'sortorder',
        'active',
        'libelle',
        'libelle_facture',
        'type_cdr',
        'nbjour',
        'decalage',
        'deposit_percent',
        'module',
        'position',
    ];
}
