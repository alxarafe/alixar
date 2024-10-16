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

use Dolibarr\Code\Categories\Model\Categorie;
use Dolibarr\Core\Base\Model;

/**
 * Class ElementCategorie
 *
 * @property int $rowid
 * @property int $fk_categorie
 * @property int $fk_element
 * @property string|null $import_key
 *
 * @property Categorie $categorie
 */
class ElementCategorie extends Model
{
    public $timestamps = false;
    protected $table = 'element_categorie';
    protected $casts = [
        'fk_categorie' => 'int',
        'fk_element' => 'int'
    ];

    protected $fillable = [
        'fk_categorie',
        'fk_element',
        'import_key'
    ];

    public function categorie()
    {
        return $this->belongsTo(Categorie::class, 'fk_categorie');
    }
}
