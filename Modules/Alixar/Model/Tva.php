<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class Tva
 * Represents table tva
 */
class Tva extends Model
{
    protected $table = 'tva';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'datec',
        'datep',
        'datev',
        'amount',
        'fk_typepayment',
        'num_payment',
        'label',
        'entity',
        'note',
        'paye',
        'fk_account',
        'fk_user_creat',
        'fk_user_modif',
        'import_key',
    ];
}
