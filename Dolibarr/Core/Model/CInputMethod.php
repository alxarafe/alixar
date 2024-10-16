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
 * Class CInputMethod
 *
 * @property int $rowid
 * @property string|null $code
 * @property string|null $libelle
 * @property int $active
 * @property string|null $module
 */
class CInputMethod extends Model
{
    public $timestamps = false;
    protected $table = 'c_input_method';
    protected $casts = [
        'active' => 'int'
    ];

    protected $fillable = [
        'code',
        'libelle',
        'active',
        'module'
    ];
}
