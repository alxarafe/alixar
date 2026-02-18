<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class MemberTypeExtrafields
 * Represents table adherent_type_extrafields
 */
class MemberTypeExtrafields extends Model
{
    protected $table = 'adherent_type_extrafields';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_object',
        'import_key',
    ];
}
