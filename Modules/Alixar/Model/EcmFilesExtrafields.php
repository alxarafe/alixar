<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class EcmFilesExtrafields
 * Represents table ecm_files_extrafields
 */
class EcmFilesExtrafields extends Model
{
    protected $table = 'ecm_files_extrafields';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_object',
        'import_key',
    ];
}
