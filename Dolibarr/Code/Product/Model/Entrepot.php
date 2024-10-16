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
use Dolibarr\Code\ProductStock\Model\CategorieWarehouse;
use Dolibarr\Core\Base\Model;
use Illuminate\Database\Eloquent\Collection;

/**
 * Class Entrepot
 *
 * @property int $rowid
 * @property string $ref
 * @property Carbon|null $datec
 * @property Carbon|null $tms
 * @property int $entity
 * @property int|null $fk_project
 * @property string|null $description
 * @property string|null $lieu
 * @property string|null $address
 * @property string|null $zip
 * @property string|null $town
 * @property int|null $fk_departement
 * @property int|null $fk_pays
 * @property string|null $phone
 * @property string|null $fax
 * @property string|null $barcode
 * @property int|null $fk_barcode_type
 * @property int|null $warehouse_usage
 * @property int|null $statut
 * @property int|null $fk_user_author
 * @property string|null $model_pdf
 * @property string|null $import_key
 * @property int|null $fk_parent
 *
 * @property Collection|CategorieWarehouse[] $categorie_warehouses
 * @property Collection|Product[] $products
 * @property Collection|ProductStock[] $product_stocks
 */
class Entrepot extends Model
{
    public $timestamps = false;
    protected $table = 'entrepot';
    protected $casts = [
        'datec' => 'datetime',
        'tms' => 'datetime',
        'entity' => 'int',
        'fk_project' => 'int',
        'fk_departement' => 'int',
        'fk_pays' => 'int',
        'fk_barcode_type' => 'int',
        'warehouse_usage' => 'int',
        'statut' => 'int',
        'fk_user_author' => 'int',
        'fk_parent' => 'int'
    ];

    protected $fillable = [
        'ref',
        'datec',
        'tms',
        'entity',
        'fk_project',
        'description',
        'lieu',
        'address',
        'zip',
        'town',
        'fk_departement',
        'fk_pays',
        'phone',
        'fax',
        'barcode',
        'fk_barcode_type',
        'warehouse_usage',
        'statut',
        'fk_user_author',
        'model_pdf',
        'import_key',
        'fk_parent'
    ];

    public function categorie_warehouses()
    {
        return $this->hasMany(CategorieWarehouse::class, 'fk_warehouse');
    }

    public function products()
    {
        return $this->hasMany(Product::class, 'fk_default_warehouse');
    }

    public function product_stocks()
    {
        return $this->hasMany(ProductStock::class, 'fk_entrepot');
    }
}
