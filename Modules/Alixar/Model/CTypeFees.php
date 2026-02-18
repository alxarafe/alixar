<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class CTypeFees
 * Represents table c_type_fees
 */
class CTypeFees extends Model
{
    protected $table = 'c_type_fees';
    protected $primaryKey = 'id';
    public $timestamps = false;

    protected $fillable = [
        'id',
        'code',
        'label',
        'type',
        'accountancy_code',
        'active',
        'module',
        'position',
    ];
}
