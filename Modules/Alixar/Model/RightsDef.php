<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class RightsDef
 * Represents table rights_def
 */
class RightsDef extends Model
{
    protected $table = 'rights_def';
    protected $primaryKey = 'id';
    public $timestamps = false;

    protected $fillable = [
        'id',
        'entity',
        'libelle',
        'module',
        'module_origin',
        'module_position',
        'family_position',
        'perms',
        'subperms',
        'type',
        'bydefault',
        'enabled',
    ];
}
