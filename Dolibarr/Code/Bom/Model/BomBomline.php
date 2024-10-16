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

namespace Dolibarr\Code\Bom\Model;

use Carbon\Carbon;
use Dolibarr\Core\Base\Model;

/**
 * Class BomBomline
 *
 * @property int $rowid
 * @property int $fk_bom
 * @property int $fk_product
 * @property int|null $fk_bom_child
 * @property Carbon|null $tms
 * @property string|null $description
 * @property string|null $import_key
 * @property float $qty
 * @property int|null $qty_frozen
 * @property int|null $disable_stock_change
 * @property float $efficiency
 * @property int|null $fk_unit
 * @property int $position
 * @property int|null $fk_default_workstation
 *
 * @property BomBom $bom_bom
 */
class BomBomline extends Model
{
    public $timestamps = false;
    protected $table = 'bom_bomline';
    protected $casts = [
        'fk_bom' => 'int',
        'fk_product' => 'int',
        'fk_bom_child' => 'int',
        'tms' => 'datetime',
        'qty' => 'float',
        'qty_frozen' => 'int',
        'disable_stock_change' => 'int',
        'efficiency' => 'float',
        'fk_unit' => 'int',
        'position' => 'int',
        'fk_default_workstation' => 'int'
    ];

    protected $fillable = [
        'fk_bom',
        'fk_product',
        'fk_bom_child',
        'tms',
        'description',
        'import_key',
        'qty',
        'qty_frozen',
        'disable_stock_change',
        'efficiency',
        'fk_unit',
        'position',
        'fk_default_workstation'
    ];

    public function bom_bom()
    {
        return $this->belongsTo(BomBom::class, 'fk_bom');
    }
}
