<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class InvoiceRecExtrafields
 * Represents table facture_rec_extrafields
 */
class InvoiceRecExtrafields extends Model
{
    protected $table = 'facture_rec_extrafields';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_object',
        'import_key',
    ];
}
