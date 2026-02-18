<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class CCivility
 * Represents table c_civility
 */
class CCivility extends Model
{
    protected $table = 'c_civility';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'code',
        'label',
        'active',
        'module',
    ];
}
