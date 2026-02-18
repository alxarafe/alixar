<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class CategorieSupplierInvoice
 * Represents table categorie_supplier_invoice
 */
class CategorieSupplierInvoice extends Model
{
    protected $table = 'categorie_supplier_invoice';
    protected $primaryKey = 'id';
    public $timestamps = false;

    protected $fillable = [
        'fk_categorie',
        'fk_supplier_invoice',
        'import_key',
    ];
}
