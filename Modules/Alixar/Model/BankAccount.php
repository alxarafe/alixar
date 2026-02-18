<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class BankAccount
 * Represents table bank
 */
class BankAccount extends Model
{
    protected $table = 'bank';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'datec',
        'datev',
        'dateo',
        'amount',
        'amount_main_currency',
        'label',
        'fk_account',
        'fk_user_author',
        'fk_user_rappro',
        'fk_type',
        'num_releve',
        'num_chq',
        'numero_compte',
        'rappro',
        'note',
        'fk_bordereau',
        'position',
        'banque',
        'emetteur',
        'author',
        'origin_id',
        'origin_type',
        'import_key',
    ];
}
