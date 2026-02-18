<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class CategorieProject
 * Represents table categorie_project
 */
class CategorieProject extends Model
{
    protected $table = 'categorie_project';
    protected $primaryKey = 'id';
    public $timestamps = false;

    protected $fillable = [
        'fk_categorie',
        'fk_project',
        'import_key',
    ];
}
