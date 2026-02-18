<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class Notify
 * Represents table notify
 */
class Notify extends Model
{
    protected $table = 'notify';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'daten',
        'fk_action',
        'fk_soc',
        'fk_contact',
        'fk_user',
        'type',
        'type_target',
        'objet_type',
        'objet_id',
        'email',
    ];
}
