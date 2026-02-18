<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class CActioncomm
 * Represents table c_actioncomm
 */
class CActioncomm extends Model
{
    protected $table = 'c_actioncomm';
    protected $primaryKey = 'id';
    public $timestamps = false;

    protected $fillable = [
        'id',
        'code',
        'type',
        'libelle',
        'module',
        'active',
        'todo',
        'color',
        'picto',
        'position',
    ];
}
