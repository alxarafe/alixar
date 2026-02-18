<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class CategorieProduct
 * Represents table categorie_product
 */
class CategorieProduct extends Model
{
    protected $table = 'categorie_product';
    protected $primaryKey = 'id';
    public $timestamps = false;

    protected $fillable = [
        'fk_categorie',
        'fk_product',
        'import_key',
    ];
}
