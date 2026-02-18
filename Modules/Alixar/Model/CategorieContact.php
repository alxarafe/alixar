<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class CategorieContact
 * Represents table categorie_contact
 */
class CategorieContact extends Model
{
    protected $table = 'categorie_contact';
    protected $primaryKey = 'id';
    public $timestamps = false;

    protected $fillable = [
        'fk_categorie',
        'fk_socpeople',
        'import_key',
    ];
}
