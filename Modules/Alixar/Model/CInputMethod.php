<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class CInputMethod
 * Represents table c_input_method
 */
class CInputMethod extends Model
{
    protected $table = 'c_input_method';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'code',
        'libelle',
        'active',
        'module',
    ];
}
