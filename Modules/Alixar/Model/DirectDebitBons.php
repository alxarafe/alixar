<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class DirectDebitBons
 * Represents table prelevement_bons
 */
class DirectDebitBons extends Model
{
    protected $table = 'prelevement_bons';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'type',
        'ref',
        'entity',
        'datec',
        'amount',
        'statut',
        'credite',
        'note',
        'date_trans',
        'method_trans',
        'fk_user_trans',
        'date_credit',
        'fk_user_credit',
        'fk_bank_account',
    ];
}
