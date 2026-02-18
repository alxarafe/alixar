<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class Const
 * Represents table const
 */
class Const extends Model
{
    protected $table = 'const';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'name',
        'entity',
        'value',
        'type',
        'visible',
        'note',
    ];
}
