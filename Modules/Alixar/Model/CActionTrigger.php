<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class CActionTrigger
 * Represents table c_action_trigger
 */
class CActionTrigger extends Model
{
    protected $table = 'c_action_trigger';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'elementtype',
        'code',
        'contexts',
        'label',
        'description',
        'rang',
    ];
}
