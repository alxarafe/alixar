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

namespace Dolibarr\Code\Compta\Model;

use Dolibarr\Core\Base\Model;

/**
 * Class CPaiement
 *
 * @property int $id
 * @property int $entity
 * @property string $code
 * @property string|null $libelle
 * @property int|null $type
 * @property int $active
 * @property string|null $accountancy_code
 * @property string|null $module
 * @property int $position
 */
class CPaiement extends Model
{
    public $timestamps = false;
    protected $table = 'c_paiement';
    protected $casts = [
        'entity' => 'int',
        'type' => 'int',
        'active' => 'int',
        'position' => 'int'
    ];

    protected $fillable = [
        'entity',
        'code',
        'libelle',
        'type',
        'active',
        'accountancy_code',
        'module',
        'position'
    ];
}
