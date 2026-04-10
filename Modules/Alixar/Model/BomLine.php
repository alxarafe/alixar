<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class BomLine
 * Represents table bom_bomline (Líneas de lista de materiales)
 */
class BomLine extends Model
{
    protected $table = 'bom_bomline';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_bom',
        'fk_product',
        'fk_bom_child',
        'description',
        'qty',
        'qty_frozen',
        'disable_stock_change',
        'efficiency',
        'position',
        'import_key',
    ];
}
