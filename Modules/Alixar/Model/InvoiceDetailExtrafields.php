<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class InvoiceDetailExtrafields
 * Represents table facturedet_extrafields
 */
class InvoiceDetailExtrafields extends Model
{
    protected $table = 'facturedet_extrafields';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_object',
        'import_key',
    ];
}
