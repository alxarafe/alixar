<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class UserGroupRights
 * Represents table usergroup_rights
 */
class UserGroupRights extends Model
{
    protected $table = 'usergroup_rights';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'entity',
        'fk_usergroup',
        'fk_id',
    ];
}
