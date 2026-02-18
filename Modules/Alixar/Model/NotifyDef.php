<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class NotifyDef
 * Represents table notify_def
 */
class NotifyDef extends Model
{
    protected $table = 'notify_def';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'entity',
        'datec',
        'fk_action',
        'fk_soc',
        'fk_contact',
        'fk_user',
        'email',
        'threshold',
        'context',
        'type',
    ];
}
