<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class Salary
 * Represents table salary
 */
class Salary extends Model
{
    protected $table = 'salary';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'ref',
        'ref_ext',
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
        'note_public',
        'fk_bank',
        'paye',
        'fk_account',
        'fk_user_author',
        'fk_user_modif',
    ];
}
