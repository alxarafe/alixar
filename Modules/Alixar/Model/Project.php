<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class Project
 * Represents table projet
 */
class Project extends Model
{
    protected $table = 'projet';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_project',
        'fk_soc',
        'datec',
        'dateo',
        'datee',
        'ref',
        'ref_ext',
        'entity',
        'title',
        'description',
        'fk_user_creat',
        'fk_user_modif',
        'public',
        'fk_statut',
        'fk_opp_status',
        'opp_percent',
        'fk_opp_status_end',
        'date_close',
        'fk_user_close',
        'note_private',
        'note_public',
        'email_msgid',
        'email_date',
        'opp_amount',
        'budget_amount',
        'usage_opportunity',
        'usage_task',
        'usage_bill_time',
        'usage_organize_event',
        'date_start_event',
        'date_end_event',
        'location',
        'accept_conference_suggestions',
        'accept_booth_suggestions',
        'max_attendees',
        'price_registration',
        'price_booth',
        'model_pdf',
        'ip',
        'last_main_doc',
        'import_key',
        'extraparams',
    ];
}
