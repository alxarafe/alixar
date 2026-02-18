<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class UserAlert
 * Represents table user_alert
 */
class UserAlert extends Model
{
    protected $table = 'user_alert';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'type',
        'fk_contact',
        'fk_user',
    ];
}
