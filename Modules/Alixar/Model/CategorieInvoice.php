<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class CategorieInvoice
 * Represents table categorie_invoice
 */
class CategorieInvoice extends Model
{
    protected $table = 'categorie_invoice';
    protected $primaryKey = 'id';
    public $timestamps = false;

    protected $fillable = [
        'fk_categorie',
        'fk_invoice',
        'import_key',
    ];
}
