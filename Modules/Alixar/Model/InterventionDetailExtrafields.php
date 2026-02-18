<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class InterventionDetailExtrafields
 * Represents table fichinterdet_extrafields
 */
class InterventionDetailExtrafields extends Model
{
    protected $table = 'fichinterdet_extrafields';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_object',
        'import_key',
    ];
}
