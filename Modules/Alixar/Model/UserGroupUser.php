<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class UserGroupUser
 * Represents table usergroup_user
 */
class UserGroupUser extends Model
{
    protected $table = 'usergroup_user';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'entity',
        'fk_user',
        'fk_usergroup',
    ];
}
