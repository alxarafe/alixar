<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class ContractDetailExtrafields
 * Represents table contratdet_extrafields
 */
class ContractDetailExtrafields extends Model
{
    protected $table = 'contratdet_extrafields';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_object',
        'import_key',
    ];
}
