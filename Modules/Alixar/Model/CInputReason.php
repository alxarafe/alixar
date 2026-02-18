<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class CInputReason
 * Represents table c_input_reason
 */
class CInputReason extends Model
{
    protected $table = 'c_input_reason';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'code',
        'label',
        'active',
        'module',
    ];
}
