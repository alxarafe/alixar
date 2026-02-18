<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class OverwriteTrans
 * Represents table overwrite_trans
 */
class OverwriteTrans extends Model
{
    protected $table = 'overwrite_trans';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'entity',
        'lang',
        'transkey',
        'transvalue',
    ];
}
