<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class NotifyDefObject
 * Represents table notify_def_object
 */
class NotifyDefObject extends Model
{
    protected $table = 'notify_def_object';
    protected $primaryKey = 'id';
    public $timestamps = false;

    protected $fillable = [
        'id',
        'entity',
        'objet_type',
        'objet_id',
        'type_notif',
        'date_notif',
        'user_id',
        'moreparam',
    ];
}
