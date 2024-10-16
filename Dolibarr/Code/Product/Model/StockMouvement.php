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

namespace Dolibarr\Code\Product\Model;

use Carbon\Carbon;
use Dolibarr\Code\Mrp\Model\MrpProduction;
use Dolibarr\Core\Base\Model;
use Illuminate\Database\Eloquent\Collection;

/**
 * Class StockMouvement
 *
 * @property int $rowid
 * @property Carbon|null $tms
 * @property Carbon|null $datem
 * @property int $fk_product
 * @property string|null $batch
 * @property Carbon|null $eatby
 * @property Carbon|null $sellby
 * @property int $fk_entrepot
 * @property float|null $value
 * @property float|null $price
 * @property int|null $type_mouvement
 * @property int|null $fk_user_author
 * @property string|null $label
 * @property string|null $inventorycode
 * @property int|null $fk_project
 * @property int|null $fk_origin
 * @property string|null $origintype
 * @property string|null $model_pdf
 * @property int $fk_projet
 *
 * @property Collection|MrpProduction[] $mrp_productions
 */
class StockMouvement extends Model
{
    public $timestamps = false;
    protected $table = 'stock_mouvement';
    protected $casts = [
        'tms' => 'datetime',
        'datem' => 'datetime',
        'fk_product' => 'int',
        'eatby' => 'datetime',
        'sellby' => 'datetime',
        'fk_entrepot' => 'int',
        'value' => 'float',
        'price' => 'float',
        'type_mouvement' => 'int',
        'fk_user_author' => 'int',
        'fk_project' => 'int',
        'fk_origin' => 'int',
        'fk_projet' => 'int'
    ];

    protected $fillable = [
        'tms',
        'datem',
        'fk_product',
        'batch',
        'eatby',
        'sellby',
        'fk_entrepot',
        'value',
        'price',
        'type_mouvement',
        'fk_user_author',
        'label',
        'inventorycode',
        'fk_project',
        'fk_origin',
        'origintype',
        'model_pdf',
        'fk_projet'
    ];

    public function mrp_productions()
    {
        return $this->hasMany(MrpProduction::class, 'fk_stock_movement');
    }
}
