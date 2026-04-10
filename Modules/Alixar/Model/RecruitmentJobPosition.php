<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class RecruitmentJobPosition
 * Represents table recruitment_recruitmentjobposition (Ofertas de empleo)
 * Dolibarr: htdocs/recruitment/class/recruitmentjobposition.class.php
 */
class RecruitmentJobPosition extends Model
{
    protected $table = 'recruitment_recruitmentjobposition';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'ref',
        'entity',
        'datec',
        'tms',
        'label',
        'description',
        'date_planned',
        'qty',
        'fk_soc',
        'fk_project',
        'fk_user_creat',
        'fk_user_modif',
        'fk_establishment',
        'email_recruiter',
        'remuneration_suggested',
        'status',
        'note_public',
        'note_private',
        'import_key',
    ];
}
