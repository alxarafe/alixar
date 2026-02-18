<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class CPropalst
 * Represents table c_propalst
 */
class CPropalst extends Model
{
    protected $table = 'c_propalst';
    protected $primaryKey = 'id';
    public $timestamps = false;

    protected $fillable = [
        'id',
        'code',
        'label',
        'sortorder',
        'active',
    ];
}
