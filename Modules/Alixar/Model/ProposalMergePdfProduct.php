<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class ProposalMergePdfProduct
 * Represents table propal_merge_pdf_product
 */
class ProposalMergePdfProduct extends Model
{
    protected $table = 'propal_merge_pdf_product';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_product',
        'file_name',
        'lang',
        'fk_user_author',
        'fk_user_mod',
        'datec',
        'import_key',
    ];
}
