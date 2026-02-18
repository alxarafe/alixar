<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class Paiementcharge
 * Represents table paiementcharge
 */
class Paiementcharge extends Model
{
    protected $table = 'paiementcharge';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_charge',
        'datec',
        'datep',
        'amount',
        'fk_typepaiement',
        'num_paiement',
        'note',
        'fk_bank',
        'fk_user_creat',
        'fk_user_modif',
    ];
}
