<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class CRevenuestamp
 * Represents table c_revenuestamp
 */
class CRevenuestamp extends Model
{
    protected $table = 'c_revenuestamp';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_pays',
        'taux',
        'revenuestamp_type',
        'note',
        'active',
        'accountancy_code_sell',
        'accountancy_code_buy',
    ];
}
