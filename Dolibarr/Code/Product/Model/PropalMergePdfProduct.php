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
use Dolibarr\Core\Base\Model;

/**
 * Class PropalMergePdfProduct
 *
 * @property int $rowid
 * @property int $fk_product
 * @property string $file_name
 * @property string|null $lang
 * @property int|null $fk_user_author
 * @property int $fk_user_mod
 * @property Carbon $datec
 * @property Carbon|null $tms
 * @property string|null $import_key
 */
class PropalMergePdfProduct extends Model
{
    public $timestamps = false;
    protected $table = 'propal_merge_pdf_product';
    protected $casts = [
        'fk_product' => 'int',
        'fk_user_author' => 'int',
        'fk_user_mod' => 'int',
        'datec' => 'datetime',
        'tms' => 'datetime'
    ];

    protected $fillable = [
        'fk_product',
        'file_name',
        'lang',
        'fk_user_author',
        'fk_user_mod',
        'datec',
        'tms',
        'import_key'
    ];
}
