<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class CategoryBank
 * Represents table category_bank
 */
class CategoryBank extends Model
{
    protected $table = 'category_bank';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'label',
        'entity',
    ];
}
