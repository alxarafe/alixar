<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class EcmDirectoriesExtrafields
 * Represents table ecm_directories_extrafields
 */
class EcmDirectoriesExtrafields extends Model
{
    protected $table = 'ecm_directories_extrafields';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_object',
        'import_key',
    ];
}
