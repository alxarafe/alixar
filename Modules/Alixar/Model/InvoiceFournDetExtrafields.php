<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class InvoiceFournDetExtrafields
 * Represents table facture_fourn_det_extrafields
 */
class InvoiceFournDetExtrafields extends Model
{
    protected $table = 'facture_fourn_det_extrafields';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_object',
        'import_key',
    ];
}
