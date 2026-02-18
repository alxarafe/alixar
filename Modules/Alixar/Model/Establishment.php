<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class Establishment
 * Represents table establishment
 */
class Establishment extends Model
{
    protected $table = 'establishment';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'entity',
        'ref',
        'label',
        'name',
        'address',
        'zip',
        'town',
        'fk_state',
        'fk_country',
        'profid1',
        'profid2',
        'profid3',
        'phone',
        'fk_user_author',
        'fk_user_mod',
        'datec',
        'status',
    ];
}
