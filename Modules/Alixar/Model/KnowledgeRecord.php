<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class KnowledgeRecord
 * Represents table knowledgemanagement_knowledgerecord (Base de conocimiento)
 * Dolibarr: htdocs/knowledgemanagement/class/knowledgerecord.class.php
 */
class KnowledgeRecord extends Model
{
    protected $table = 'knowledgemanagement_knowledgerecord';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'ref',
        'entity',
        'datec',
        'tms',
        'question',
        'answer',
        'fk_c_ticket_category',
        'lang',
        'fk_user_creat',
        'fk_user_modif',
        'fk_user_valid',
        'status',
        'date_creation',
        'date_validation',
        'note_public',
        'note_private',
        'import_key',
        'model_pdf',
    ];
}
