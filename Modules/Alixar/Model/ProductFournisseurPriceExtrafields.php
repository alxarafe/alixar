<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class ProductFournisseurPriceExtrafields
 * Represents table product_fournisseur_price_extrafields
 */
class ProductFournisseurPriceExtrafields extends Model
{
    protected $table = 'product_fournisseur_price_extrafields';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_object',
        'import_key',
    ];
}
