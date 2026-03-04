<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;
use Modules\Alixar\Lib\Trait\HasReference;

/**
 * Class Payment
 * Represents table paiement
 */
class Payment extends Model
{
    use HasReference;

    /**
     * Get the bank movement associated with this payment.
     */
    public function bankMovement()
    {
        return $this->belongsTo(BankAccount::class, 'fk_bank', 'rowid');
    }

    /**
     * Get the invoices linked to this payment.
     */
    public function invoices()
    {
        return $this->belongsToMany(Invoice::class, 'paiement_facture', 'fk_paiement', 'fk_facture')->withPivot('amount');
    }

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
