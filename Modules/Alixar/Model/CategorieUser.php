<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class CategorieUser
 * Represents table categorie_user
 */
class CategorieUser extends Model
{
    protected $table = 'categorie_user';
    protected $primaryKey = 'id';
    public $timestamps = false;

    protected $fillable = [
        'fk_categorie',
        'fk_user',
        'import_key',
    ];
}
