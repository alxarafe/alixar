<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class ProductLot
 * Represents table product_lot
 */
class ProductLot extends Model
{
    protected $table = 'product_lot';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'entity',
        'fk_product',
        'batch',
        'note_public',
        'note_private',
        'eatby',
        'sellby',
        'eol_date',
        'manufacturing_date',
        'scrapping_date',
        'qc_frequency',
        'lifetime',
        'barcode',
        'fk_barcode_type',
        'model_pdf',
        'last_main_doc',
        'datec',
        'fk_user_creat',
        'fk_user_modif',
        'import_key',
    ];
}
