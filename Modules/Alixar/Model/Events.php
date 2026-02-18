<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class Events
 * Represents table events
 */
class Events extends Model
{
    protected $table = 'events';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'type',
        'entity',
        'prefix_session',
        'dateevent',
        'fk_user',
        'description',
        'ip',
        'user_agent',
        'fk_object',
        'authentication_method',
        'fk_oauth_token',
    ];
}
