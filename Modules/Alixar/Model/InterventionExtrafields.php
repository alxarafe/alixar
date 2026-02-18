<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class InterventionExtrafields
 * Represents table fichinter_extrafields
 */
class InterventionExtrafields extends Model
{
    protected $table = 'fichinter_extrafields';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_object',
        'import_key',
    ];
}
