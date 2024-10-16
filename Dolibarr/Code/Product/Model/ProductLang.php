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

use Dolibarr\Core\Base\Model;

/**
 * Class ProductLang
 *
 * @property int $rowid
 * @property int $fk_product
 * @property string $lang
 * @property string $label
 * @property string|null $description
 * @property string|null $note
 * @property string|null $import_key
 *
 * @property Product $product
 */
class ProductLang extends Model
{
    public $timestamps = false;
    protected $table = 'product_lang';
    protected $casts = [
        'fk_product' => 'int'
    ];

    protected $fillable = [
        'fk_product',
        'lang',
        'label',
        'description',
        'note',
        'import_key'
    ];

    public function product()
    {
        return $this->belongsTo(Product::class, 'fk_product');
    }
}
