<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class UserGroupExtrafields
 * Represents table usergroup_extrafields
 */
class UserGroupExtrafields extends Model
{
    protected $table = 'usergroup_extrafields';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_object',
        'import_key',
    ];
}
