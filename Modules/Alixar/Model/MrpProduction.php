<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class MrpProduction
 * Represents table mrp_production (Líneas de producción de MO)
 */
class MrpProduction extends Model
{
    protected $table = 'mrp_production';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_mo',
        'origin_id',
        'origin_type',
        'position',
        'fk_product',
        'fk_warehouse',
        'qty',
        'qty_frozen',
        'disable_stock_change',
        'batch',
        'role',
        'datec',
        'tms',
        'fk_user_creat',
        'fk_user_modif',
    ];
}
