<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class EventorganizationConferenceorboothattendee
 * Represents table eventorganization_conferenceorboothattendee
 */
class EventorganizationConferenceorboothattendee extends Model
{
    protected $table = 'eventorganization_conferenceorboothattendee';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'ref',
        'fk_soc',
        'fk_actioncomm',
        'fk_project',
        'fk_invoice',
        'email',
        'email_company',
        'firstname',
        'lastname',
        'date_subscription',
        'amount',
        'note_public',
        'note_private',
        'date_creation',
        'fk_user_creat',
        'fk_user_modif',
        'last_main_doc',
        'ip',
        'import_key',
        'model_pdf',
        'status',
    ];
}
