<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class ProductLang
 * Represents table product_lang
 */
class ProductLang extends Model
{
    protected $table = 'product_lang';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_product',
        'lang',
        'label',
        'description',
        'note',
        'import_key',
    ];
}
