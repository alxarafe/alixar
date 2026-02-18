<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class Cronjob
 * Represents table cronjob
 */
class Cronjob extends Model
{
    protected $table = 'cronjob';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'datec',
        'jobtype',
        'label',
        'command',
        'classesname',
        'objectname',
        'methodename',
        'params',
        'md5params',
        'module_name',
        'priority',
        'datelastrun',
        'datenextrun',
        'datestart',
        'dateend',
        'datelastresult',
        'lastresult',
        'lastoutput',
        'unitfrequency',
        'frequency',
        'maxrun',
        'nbrun',
        'autodelete',
        'status',
        'processing',
        'pid',
        'test',
        'fk_user_author',
        'fk_user_mod',
        'fk_mailing',
        'note',
        'libname',
        'email_alert',
        'entity',
    ];
}
