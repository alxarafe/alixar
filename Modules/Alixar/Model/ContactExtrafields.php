<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class ContactExtrafields
 * Represents table socpeople_extrafields
 */
class ContactExtrafields extends Model
{
    protected $table = 'socpeople_extrafields';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_object',
        'import_key',
    ];
}
