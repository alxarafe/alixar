<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class CategoryBankline
 * Represents table category_bankline
 */
class CategoryBankline extends Model
{
    protected $table = 'category_bankline';
    protected $primaryKey = 'id';
    public $timestamps = false;

    protected $fillable = [
        'lineid',
        'fk_categ',
    ];
}
