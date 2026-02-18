<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class ProductLotExtrafields
 * Represents table product_lot_extrafields
 */
class ProductLotExtrafields extends Model
{
    protected $table = 'product_lot_extrafields';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_object',
        'import_key',
    ];
}
