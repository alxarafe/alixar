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

namespace Dolibarr\Code\Expedition\Model;

use Dolibarr\Core\Base\Model;

/**
 * Class ExpeditionPackage
 *
 * @property int $rowid
 * @property int $fk_expedition
 * @property string|null $description
 * @property float|null $value
 * @property int|null $fk_package_type
 * @property float|null $height
 * @property float|null $width
 * @property float|null $size
 * @property int|null $size_units
 * @property float|null $weight
 * @property int|null $weight_units
 * @property int|null $dangerous_goods
 * @property int|null $tail_lift
 * @property int|null $rang
 */
class ExpeditionPackage extends Model
{
    public $timestamps = false;
    protected $table = 'expedition_package';
    protected $casts = [
        'fk_expedition' => 'int',
        'value' => 'float',
        'fk_package_type' => 'int',
        'height' => 'float',
        'width' => 'float',
        'size' => 'float',
        'size_units' => 'int',
        'weight' => 'float',
        'weight_units' => 'int',
        'dangerous_goods' => 'int',
        'tail_lift' => 'int',
        'rang' => 'int'
    ];

    protected $fillable = [
        'fk_expedition',
        'description',
        'value',
        'fk_package_type',
        'height',
        'width',
        'size',
        'size_units',
        'weight',
        'weight_units',
        'dangerous_goods',
        'tail_lift',
        'rang'
    ];
}
