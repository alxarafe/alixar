<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class InvoiceExtrafields
 * Represents table facture_extrafields
 */
class InvoiceExtrafields extends Model
{
    protected $table = 'facture_extrafields';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_object',
        'import_key',
    ];
}
