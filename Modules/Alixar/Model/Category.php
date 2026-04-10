<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class Category
 * Represents table categorie (Categorías / etiquetas)
 * Dolibarr: htdocs/categories/class/categorie.class.php
 */
class Category extends Model
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
        'tms',
        'fk_user_creat',
        'fk_user_modif',
        'import_key',
    ];

    public function parent()
    {
        return $this->belongsTo(self::class, 'fk_parent', 'rowid');
    }

    public function children()
    {
        return $this->hasMany(self::class, 'fk_parent', 'rowid');
    }
}
