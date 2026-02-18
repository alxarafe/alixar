<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class ProposalExtrafields
 * Represents table propal_extrafields
 */
class ProposalExtrafields extends Model
{
    protected $table = 'propal_extrafields';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_object',
        'import_key',
    ];
}
