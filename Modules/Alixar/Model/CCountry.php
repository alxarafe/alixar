<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class CCountry
 * Represents table c_country
 */
class CCountry extends Model
{
    protected $table = 'c_country';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'code',
        'code_iso',
        'numeric_code',
        'label',
        'eec',
        'active',
        'favorite',
    ];
}
