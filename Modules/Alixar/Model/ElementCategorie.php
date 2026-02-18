<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class ElementCategorie
 * Represents table element_categorie
 */
class ElementCategorie extends Model
{
    protected $table = 'element_categorie';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_categorie',
        'fk_element',
        'import_key',
    ];
}
