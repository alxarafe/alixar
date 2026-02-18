<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class ProjectTaskExtrafields
 * Represents table projet_task_extrafields
 */
class ProjectTaskExtrafields extends Model
{
    protected $table = 'projet_task_extrafields';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_object',
        'import_key',
    ];
}
