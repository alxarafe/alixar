<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class CategorieWarehouse
 * Represents table categorie_warehouse
 */
class CategorieWarehouse extends Model
{
    protected $table = 'categorie_warehouse';
    protected $primaryKey = 'id';
    public $timestamps = false;

    protected $fillable = [
        'fk_categorie',
        'fk_warehouse',
        'import_key',
    ];
}
