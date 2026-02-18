<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class ProposalDetailExtrafields
 * Represents table propaldet_extrafields
 */
class ProposalDetailExtrafields extends Model
{
    protected $table = 'propaldet_extrafields';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_object',
        'import_key',
    ];
}
