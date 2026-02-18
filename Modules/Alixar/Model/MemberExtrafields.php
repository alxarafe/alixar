<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class MemberExtrafields
 * Represents table adherent_extrafields
 */
class MemberExtrafields extends Model
{
    protected $table = 'adherent_extrafields';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_object',
        'import_key',
    ];
}
