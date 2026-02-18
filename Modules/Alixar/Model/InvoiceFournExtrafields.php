<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class InvoiceFournExtrafields
 * Represents table facture_fourn_extrafields
 */
class InvoiceFournExtrafields extends Model
{
    protected $table = 'facture_fourn_extrafields';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_object',
        'import_key',
    ];
}
