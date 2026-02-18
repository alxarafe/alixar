<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class UserRights
 * Represents table user_rights
 */
class UserRights extends Model
{
    protected $table = 'user_rights';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'entity',
        'fk_user',
        'fk_id',
    ];
}
