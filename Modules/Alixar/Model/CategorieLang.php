<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class CategorieLang
 * Represents table categorie_lang
 */
class CategorieLang extends Model
{
    protected $table = 'categorie_lang';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_category',
        'lang',
        'label',
        'description',
    ];
}
