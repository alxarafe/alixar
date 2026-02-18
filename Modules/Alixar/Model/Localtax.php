<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class Localtax
 * Represents table localtax
 */
class Localtax extends Model
{
    protected $table = 'localtax';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'entity',
        'localtaxtype',
        'datep',
        'datev',
        'amount',
        'label',
        'note',
        'fk_bank',
        'fk_user_creat',
        'fk_user_modif',
    ];
}
