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

namespace Dolibarr\Code\Categories\Model;

use Dolibarr\Core\Base\Model;

/**
 * Class CategorieLang
 *
 * @property int $rowid
 * @property int $fk_category
 * @property string $lang
 * @property string $label
 * @property string|null $description
 *
 * @property Categorie $categorie
 */
class CategorieLang extends Model
{
    public $timestamps = false;
    protected $table = 'categorie_lang';
    protected $casts = [
        'fk_category' => 'int'
    ];

    protected $fillable = [
        'fk_category',
        'lang',
        'label',
        'description'
    ];

    public function categorie()
    {
        return $this->belongsTo(Categorie::class, 'fk_category');
    }
}
