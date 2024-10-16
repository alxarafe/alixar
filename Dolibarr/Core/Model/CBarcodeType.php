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
use Dolibarr\Code\Product\Model\ProductFournisseurPrice;
use Dolibarr\Code\Ticket\Model\Ticket;
use Dolibarr\Core\Base\Model;
use Illuminate\Database\Eloquent\Collection;

/**
 * Class CBarcodeType
 *
 * @property int $rowid
 * @property string $code
 * @property int $entity
 * @property string $libelle
 * @property string $coder
 * @property string $example
 *
 * @property Collection|Product[] $products
 * @property Collection|ProductFournisseurPrice[] $product_fournisseur_prices
 * @property Collection|Ticket[] $tickets
 */
class CBarcodeType extends Model
{
    public $timestamps = false;
    protected $table = 'c_barcode_type';
    protected $casts = [
        'entity' => 'int'
    ];

    protected $fillable = [
        'code',
        'entity',
        'libelle',
        'coder',
        'example'
    ];

    public function products()
    {
        return $this->hasMany(Product::class, 'fk_barcode_type');
    }

    public function product_fournisseur_prices()
    {
        return $this->hasMany(ProductFournisseurPrice::class, 'fk_barcode_type');
    }

    public function tickets()
    {
        return $this->hasMany(Ticket::class, 'fk_barcode_type');
    }
}
