<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class CInvoiceSubtype
 * Represents table c_invoice_subtype
 */
class CInvoiceSubtype extends Model
{
    protected $table = 'c_invoice_subtype';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'entity',
        'fk_country',
        'code',
        'label',
        'active',
    ];
}
