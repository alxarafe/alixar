<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class AgendaEventExtrafields
 * Represents table actioncomm_extrafields
 */
class AgendaEventExtrafields extends Model
{
    protected $table = 'actioncomm_extrafields';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_object',
        'import_key',
    ];
}
