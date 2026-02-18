<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class SupplierProposalDetailExtrafields
 * Represents table supplier_proposaldet_extrafields
 */
class SupplierProposalDetailExtrafields extends Model
{
    protected $table = 'supplier_proposaldet_extrafields';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_object',
        'import_key',
    ];
}
