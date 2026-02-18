<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class PaiementfournFacturefourn
 * Represents table paiementfourn_facturefourn
 */
class PaiementfournFacturefourn extends Model
{
    protected $table = 'paiementfourn_facturefourn';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_paiementfourn',
        'fk_facturefourn',
        'amount',
        'multicurrency_code',
        'multicurrency_tx',
        'multicurrency_amount',
    ];
}
