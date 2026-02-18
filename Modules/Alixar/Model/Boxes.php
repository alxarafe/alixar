<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class Boxes
 * Represents table boxes
 */
class Boxes extends Model
{
    protected $table = 'boxes';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'entity',
        'box_id',
        'position',
        'box_order',
        'fk_user',
        'maxline',
        'params',
    ];
}
