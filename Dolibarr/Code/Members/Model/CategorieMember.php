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

namespace Dolibarr\Code\Members\Model;

use Dolibarr\Code\Adherents\Model\Adherent;
use Dolibarr\Code\Categories\Model\Categorie;
use Dolibarr\Core\Base\Model;

/**
 * Class CategorieMember
 *
 * @property int $fk_categorie
 * @property int $fk_member
 *
 * @property Categorie $categorie
 * @property Adherent $adherent
 */
class CategorieMember extends Model
{
    public $incrementing = false;
    public $timestamps = false;
    protected $table = 'categorie_member';
    protected $casts = [
        'fk_categorie' => 'int',
        'fk_member' => 'int'
    ];

    public function categorie()
    {
        return $this->belongsTo(Categorie::class, 'fk_categorie');
    }

    public function adherent()
    {
        return $this->belongsTo(Adherent::class, 'fk_member');
    }
}
