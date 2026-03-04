<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;
use Modules\Alixar\Lib\Trait\HasReference;

/**
 * Class Paiementfourn
 * Represents table paiementfourn
 */
class Paiementfourn extends Model
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
     * Get the supplier invoices linked to this payment.
     */
    public function invoices()
    {
        return $this->belongsToMany(InvoiceFourn::class, 'paiementfourn_facturefourn', 'fk_paiementfourn', 'fk_facturefourn')->withPivot('amount');
    }

    protected $table = 'paiementfourn';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'ref',
        'entity',
        'datec',
        'datep',
        'amount',
        'multicurrency_amount',
        'fk_user_author',
        'fk_user_modif',
        'fk_paiement',
        'num_paiement',
        'note',
        'fk_bank',
        'statut',
        'model_pdf',
    ];
}
