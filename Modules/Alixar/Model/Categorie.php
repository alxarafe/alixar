<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class Categorie
 * Represents table categorie
 */
class Categorie extends Model
{
    protected $table = 'categorie';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'entity',
        'fk_parent',
        'label',
        'ref_ext',
        'type',
        'description',
        'color',
        'position',
        'fk_soc',
        'visible',
        'date_creation',
        'fk_user_creat',
        'fk_user_modif',
        'import_key',
    ];
}
