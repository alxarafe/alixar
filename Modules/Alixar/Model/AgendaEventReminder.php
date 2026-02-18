<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class AgendaEventReminder
 * Represents table actioncomm_reminder
 */
class AgendaEventReminder extends Model
{
    protected $table = 'actioncomm_reminder';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'dateremind',
        'typeremind',
        'fk_user',
        'offsetvalue',
        'offsetunit',
        'status',
        'datedone',
        'lasterror',
        'entity',
        'fk_actioncomm',
        'fk_email_template',
    ];
}
