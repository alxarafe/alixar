<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class AgendaEventResources
 * Represents table actioncomm_resources
 */
class AgendaEventResources extends Model
{
    protected $table = 'actioncomm_resources';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_actioncomm',
        'element_type',
        'fk_element',
        'answer_status',
        'mandatory',
        'transparency',
    ];
}
