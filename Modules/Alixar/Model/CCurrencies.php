<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class CCurrencies
 * Represents table c_currencies
 */
class CCurrencies extends Model
{
    protected $table = 'c_currencies';
    protected $primaryKey = 'id';
    public $timestamps = false;

    protected $fillable = [
        'code_iso',
        'label',
        'unicode',
        'active',
    ];
}
