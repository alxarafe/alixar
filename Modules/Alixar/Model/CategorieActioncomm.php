<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class CategorieActioncomm
 * Represents table categorie_actioncomm
 */
class CategorieActioncomm extends Model
{
    protected $table = 'categorie_actioncomm';
    protected $primaryKey = 'id';
    public $timestamps = false;

    protected $fillable = [
        'fk_categorie',
        'fk_actioncomm',
        'import_key',
    ];
}
