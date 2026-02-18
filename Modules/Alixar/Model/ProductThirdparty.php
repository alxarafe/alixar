<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class ProductThirdparty
 * Represents table product_thirdparty
 */
class ProductThirdparty extends Model
{
    protected $table = 'product_thirdparty';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_product',
        'fk_soc',
        'fk_product_thirdparty_relation_type',
        'date_start',
        'date_end',
        'fk_project',
        'description',
        'note_public',
        'note_private',
        'date_creation',
        'fk_user_creat',
        'fk_user_modif',
        'last_main_doc',
        'import_key',
        'model_pdf',
        'status',
    ];
}
