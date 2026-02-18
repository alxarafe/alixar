<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class InvoiceDetailRecExtrafields
 * Represents table facturedet_rec_extrafields
 */
class InvoiceDetailRecExtrafields extends Model
{
    protected $table = 'facturedet_rec_extrafields';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_object',
        'import_key',
    ];
}
