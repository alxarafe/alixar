<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class CategorieFournisseur
 * Represents table categorie_fournisseur
 */
class CategorieFournisseur extends Model
{
    protected $table = 'categorie_fournisseur';
    protected $primaryKey = 'id';
    public $timestamps = false;

    protected $fillable = [
        'fk_categorie',
        'fk_soc',
        'import_key',
    ];
}
