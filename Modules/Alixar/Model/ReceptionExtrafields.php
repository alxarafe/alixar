<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class ReceptionExtrafields
 * Represents table reception_extrafields
 */
class ReceptionExtrafields extends Model
{
    protected $table = 'reception_extrafields';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_object',
        'import_key',
    ];
}
