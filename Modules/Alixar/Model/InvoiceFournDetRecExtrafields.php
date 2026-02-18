<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class InvoiceFournDetRecExtrafields
 * Represents table facture_fourn_det_rec_extrafields
 */
class InvoiceFournDetRecExtrafields extends Model
{
    protected $table = 'facture_fourn_det_rec_extrafields';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_object',
        'import_key',
    ];
}
