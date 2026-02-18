<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class AgendaEvent
 * Represents table actioncomm
 */
class AgendaEvent extends Model
{
    protected $table = 'actioncomm';
    protected $primaryKey = 'id';
    public $timestamps = false;

    protected $fillable = [
        'id',
        'ref',
        'ref_ext',
        'entity',
        'datep',
        'datep2',
        'fk_action',
        'code',
        'datec',
        'fk_user_author',
        'fk_user_mod',
        'fk_project',
        'fk_task',
        'fk_soc',
        'fk_contact',
        'fk_parent',
        'fk_user_action',
        'transparency',
        'priority',
        'visibility',
        'fulldayevent',
        'percent',
        'location',
        'durationp',
        'label',
        'note',
        'calling_duration',
        'email_subject',
        'email_msgid',
        'email_from',
        'email_sender',
        'email_to',
        'email_tocc',
        'email_tobcc',
        'errors_to',
        'reply_to',
        'recurid',
        'recurrule',
        'recurdateend',
        'num_vote',
        'event_paid',
        'status',
        'fk_element',
        'elementtype',
        'ip',
        'fk_bookcal_calendar',
        'import_key',
        'extraparams',
    ];
}
