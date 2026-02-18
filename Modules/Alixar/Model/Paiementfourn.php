<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class Paiementfourn
 * Represents table paiementfourn
 */
class Paiementfourn extends Model
{
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
