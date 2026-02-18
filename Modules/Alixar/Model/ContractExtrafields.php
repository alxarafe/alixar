<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class ContractExtrafields
 * Represents table contrat_extrafields
 */
class ContractExtrafields extends Model
{
    protected $table = 'contrat_extrafields';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_object',
        'import_key',
    ];
}
