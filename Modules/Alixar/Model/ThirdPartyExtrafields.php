<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class ThirdPartyExtrafields
 * Represents table societe_extrafields
 */
class ThirdPartyExtrafields extends Model
{
    protected $table = 'societe_extrafields';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_object',
        'import_key',
    ];
}
