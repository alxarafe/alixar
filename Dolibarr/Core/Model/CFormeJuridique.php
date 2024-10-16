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

use Dolibarr\Core\Base\Model;

/**
 * Class CFormeJuridique
 *
 * @property int $rowid
 * @property int $code
 * @property int $fk_pays
 * @property string|null $libelle
 * @property int $isvatexempted
 * @property int $active
 * @property string|null $module
 * @property int $position
 */
class CFormeJuridique extends Model
{
    public $timestamps = false;
    protected $table = 'c_forme_juridique';
    protected $casts = [
        'code' => 'int',
        'fk_pays' => 'int',
        'isvatexempted' => 'int',
        'active' => 'int',
        'position' => 'int'
    ];

    protected $fillable = [
        'code',
        'fk_pays',
        'libelle',
        'isvatexempted',
        'active',
        'module',
        'position'
    ];
}
