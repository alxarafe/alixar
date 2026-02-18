<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class InvoiceFournRecExtrafields
 * Represents table facture_fourn_rec_extrafields
 */
class InvoiceFournRecExtrafields extends Model
{
    protected $table = 'facture_fourn_rec_extrafields';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_object',
        'import_key',
    ];
}
