<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class Subscription
 * Represents table subscription
 */
class Subscription extends Model
{
    protected $table = 'subscription';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'datec',
        'fk_adherent',
        'fk_type',
        'dateadh',
        'datef',
        'subscription',
        'fk_bank',
        'fk_user_creat',
        'fk_user_valid',
        'note',
    ];
}
