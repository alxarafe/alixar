<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class CategorieSociete
 * Represents table categorie_societe
 */
class CategorieSociete extends Model
{
    protected $table = 'categorie_societe';
    protected $primaryKey = 'id';
    public $timestamps = false;

    protected $fillable = [
        'fk_categorie',
        'fk_soc',
        'import_key',
    ];
}
