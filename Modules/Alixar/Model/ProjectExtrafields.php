<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class ProjectExtrafields
 * Represents table projet_extrafields
 */
class ProjectExtrafields extends Model
{
    protected $table = 'projet_extrafields';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_object',
        'import_key',
    ];
}
