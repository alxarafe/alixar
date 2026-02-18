<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class ResourceExtrafields
 * Represents table resource_extrafields
 */
class ResourceExtrafields extends Model
{
    protected $table = 'resource_extrafields';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_object',
        'import_key',
    ];
}
