<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class CategorieSupplierOrder
 * Represents table categorie_supplier_order
 */
class CategorieSupplierOrder extends Model
{
    protected $table = 'categorie_supplier_order';
    protected $primaryKey = 'id';
    public $timestamps = false;

    protected $fillable = [
        'fk_categorie',
        'fk_supplier_order',
        'import_key',
    ];
}
