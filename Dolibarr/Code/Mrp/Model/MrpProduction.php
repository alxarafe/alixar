<?php

/* Copyright (C) 2024       Rafael San José         <rsanjose@alxarafe.com>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <https://www.gnu.org/licenses/>.
 */

namespace Dolibarr\Code\Mrp\Model;

use Carbon\Carbon;
use Dolibarr\Code\Product\Model\Product;
use Dolibarr\Code\Product\Model\StockMouvement;
use Dolibarr\Core\Base\Model;

/**
 * Class MrpProduction
 *
 * @property int $rowid
 * @property int $fk_mo
 * @property int|null $origin_id
 * @property string|null $origin_type
 * @property int $position
 * @property int $fk_product
 * @property int|null $fk_warehouse
 * @property float $qty
 * @property int|null $qty_frozen
 * @property int|null $disable_stock_change
 * @property string|null $batch
 * @property string|null $role
 * @property int|null $fk_mrp_production
 * @property int|null $fk_stock_movement
 * @property Carbon $date_creation
 * @property Carbon|null $tms
 * @property int $fk_user_creat
 * @property int|null $fk_user_modif
 * @property string|null $import_key
 * @property int|null $fk_default_workstation
 * @property int|null $fk_unit
 *
 * @property MrpMo $mrp_mo
 * @property Product $product
 * @property StockMouvement|null $stock_mouvement
 */
class MrpProduction extends Model
{
    public $timestamps = false;
    protected $table = 'mrp_production';
    protected $casts = [
        'fk_mo' => 'int',
        'origin_id' => 'int',
        'position' => 'int',
        'fk_product' => 'int',
        'fk_warehouse' => 'int',
        'qty' => 'float',
        'qty_frozen' => 'int',
        'disable_stock_change' => 'int',
        'fk_mrp_production' => 'int',
        'fk_stock_movement' => 'int',
        'date_creation' => 'datetime',
        'tms' => 'datetime',
        'fk_user_creat' => 'int',
        'fk_user_modif' => 'int',
        'fk_default_workstation' => 'int',
        'fk_unit' => 'int'
    ];

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
        'fk_mrp_production',
        'fk_stock_movement',
        'date_creation',
        'tms',
        'fk_user_creat',
        'fk_user_modif',
        'import_key',
        'fk_default_workstation',
        'fk_unit'
    ];

    public function mrp_mo()
    {
        return $this->belongsTo(MrpMo::class, 'fk_mo');
    }

    public function product()
    {
        return $this->belongsTo(Product::class, 'fk_product');
    }

    public function stock_mouvement()
    {
        return $this->belongsTo(StockMouvement::class, 'fk_stock_movement');
    }
}
