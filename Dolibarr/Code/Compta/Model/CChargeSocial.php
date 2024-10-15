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
 * Class CChargesociale
 *
 * @property int $id
 * @property string|null $libelle
 * @property int $deductible
 * @property int $active
 * @property string $code
 * @property string|null $accountancy_code
 * @property int $fk_pays
 * @property string|null $module
 */
class CChargeSocial extends Model
{
    public $timestamps = false;
    protected $table = 'c_chargesociales';
    protected $casts = [
        'deductible' => 'int',
        'active' => 'int',
        'fk_pays' => 'int'
    ];

    protected $fillable = [
        'libelle',
        'deductible',
        'active',
        'code',
        'accountancy_code',
        'fk_pays',
        'module'
    ];
}
