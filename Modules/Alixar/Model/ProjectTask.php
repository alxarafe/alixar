<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class ProjectTask
 * Represents table projet_task
 */
class ProjectTask extends Model
{
    protected $table = 'projet_task';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'ref',
        'entity',
        'fk_projet',
        'fk_task_parent',
        'datec',
        'dateo',
        'datee',
        'datev',
        'label',
        'description',
        'duration_effective',
        'planned_workload',
        'progress',
        'priority',
        'budget_amount',
        'fk_user_creat',
        'fk_user_modif',
        'fk_user_valid',
        'fk_statut',
        'note_private',
        'note_public',
        'rang',
        'model_pdf',
        'import_key',
        'billable',
    ];
}
