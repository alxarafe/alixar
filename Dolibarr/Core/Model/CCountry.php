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

namespace Dolibarr\Core\Model;

use Dolibarr\Code\Product\Model\Product;
use Dolibarr\Code\Resource\Model\Resource;
use Dolibarr\Core\Base\Model;
use Illuminate\Database\Eloquent\Collection;

/**
 * Class CCountry
 *
 * @property int $rowid
 * @property string $code
 * @property string|null $code_iso
 * @property string|null $numeric_code
 * @property string $label
 * @property int $eec
 * @property int $active
 * @property int $favorite
 *
 * @property Collection|CRegion[] $c_regions
 * @property Collection|CZiptown[] $c_ziptowns
 * @property Collection|Product[] $products
 * @property Collection|Resource[] $resources
 */
class CCountry extends Model
{
    public $incrementing = false;
    public $timestamps = false;
    protected $table = 'c_country';
    protected $casts = [
        'rowid' => 'int',
        'eec' => 'int',
        'active' => 'int',
        'favorite' => 'int'
    ];

    protected $fillable = [
        'code',
        'code_iso',
        'numeric_code',
        'label',
        'eec',
        'active',
        'favorite'
    ];

    public function c_regions()
    {
        return $this->hasMany(CRegion::class, 'fk_pays');
    }

    public function c_ziptowns()
    {
        return $this->hasMany(CZiptown::class, 'fk_pays');
    }

    public function products()
    {
        return $this->hasMany(Product::class, 'fk_country');
    }

    public function resources()
    {
        return $this->hasMany(Resource::class, 'fk_country');
    }
}
