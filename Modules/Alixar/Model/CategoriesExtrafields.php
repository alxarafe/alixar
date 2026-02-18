<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class CategoriesExtrafields
 * Represents table categories_extrafields
 */
class CategoriesExtrafields extends Model
{
    protected $table = 'categories_extrafields';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_object',
        'import_key',
    ];
}
