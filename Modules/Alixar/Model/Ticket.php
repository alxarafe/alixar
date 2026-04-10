<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class Ticket
 * Represents table ticket (Tickets de soporte)
 * Dolibarr: htdocs/ticket/class/ticket.class.php
 */
class Ticket extends Model
{
    protected $table = 'ticket';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'ref',
        'track_id',
        'entity',
        'datec',
        'tms',
        'fk_soc',
        'fk_project',
        'fk_user_create',
        'fk_user_assign',
        'fk_user_modif',
        'subject',
        'message',
        'type_code',
        'category_code',
        'severity_code',
        'resolution',
        'progress',
        'timing',
        'origin_email',
        'fk_statut',
        'date_read',
        'date_last_msg_sent',
        'date_close',
        'notify_tiers_at_create',
        'email_msgid',
        'ip',
        'note_public',
        'note_private',
        'model_pdf',
        'import_key',
    ];

    public function thirdParty()
    {
        return $this->belongsTo(ThirdParty::class, 'fk_soc', 'rowid');
    }
}
