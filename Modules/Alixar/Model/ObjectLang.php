<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class ObjectLang
 * Represents table object_lang
 */
class ObjectLang extends Model
{
    protected $table = 'object_lang';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_object',
        'type_object',
        'property',
        'lang',
        'value',
        'import_key',
    ];
}
