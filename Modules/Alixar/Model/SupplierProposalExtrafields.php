<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class SupplierProposalExtrafields
 * Represents table supplier_proposal_extrafields
 */
class SupplierProposalExtrafields extends Model
{
    protected $table = 'supplier_proposal_extrafields';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_object',
        'import_key',
    ];
}
