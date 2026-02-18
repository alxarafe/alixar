<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class BoxesDef
 * Represents table boxes_def
 */
class BoxesDef extends Model
{
    protected $table = 'boxes_def';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'file',
        'entity',
        'fk_user',
        'note',
    ];
}
