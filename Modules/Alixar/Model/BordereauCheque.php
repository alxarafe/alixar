<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class BordereauCheque
 * Represents table bordereau_cheque
 */
class BordereauCheque extends Model
{
    protected $table = 'bordereau_cheque';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'ref',
        'label',
        'ref_ext',
        'type',
        'datec',
        'date_bordereau',
        'amount',
        'nbcheque',
        'fk_bank_account',
        'fk_user_author',
        'statut',
        'note',
        'entity',
    ];
}
