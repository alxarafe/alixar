<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class CategorieAccount
 * Represents table categorie_account
 */
class CategorieAccount extends Model
{
    protected $table = 'categorie_account';
    protected $primaryKey = 'id';
    public $timestamps = false;

    protected $fillable = [
        'fk_categorie',
        'fk_account',
        'import_key',
    ];
}
