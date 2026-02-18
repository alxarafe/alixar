<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class StockMovementExtrafields
 * Represents table stock_mouvement_extrafields
 */
class StockMovementExtrafields extends Model
{
    protected $table = 'stock_mouvement_extrafields';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_object',
        'import_key',
    ];
}
