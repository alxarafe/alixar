<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class CategorieOrder
 * Represents table categorie_order
 */
class CategorieOrder extends Model
{
    protected $table = 'categorie_order';
    protected $primaryKey = 'id';
    public $timestamps = false;

    protected $fillable = [
        'fk_categorie',
        'fk_order',
        'import_key',
    ];
}
