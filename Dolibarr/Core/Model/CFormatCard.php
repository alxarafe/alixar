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
 * Class CFormatCard
 *
 * @property int $rowid
 * @property string $code
 * @property string $name
 * @property string $paper_size
 * @property string $orientation
 * @property string $metric
 * @property float $leftmargin
 * @property float $topmargin
 * @property int $nx
 * @property int $ny
 * @property float $spacex
 * @property float $spacey
 * @property float $width
 * @property float $height
 * @property int $font_size
 * @property float $custom_x
 * @property float $custom_y
 * @property int $active
 */
class CFormatCard extends Model
{
    public $timestamps = false;
    protected $table = 'c_format_cards';
    protected $casts = [
        'leftmargin' => 'float',
        'topmargin' => 'float',
        'nx' => 'int',
        'ny' => 'int',
        'spacex' => 'float',
        'spacey' => 'float',
        'width' => 'float',
        'height' => 'float',
        'font_size' => 'int',
        'custom_x' => 'float',
        'custom_y' => 'float',
        'active' => 'int'
    ];

    protected $fillable = [
        'code',
        'name',
        'paper_size',
        'orientation',
        'metric',
        'leftmargin',
        'topmargin',
        'nx',
        'ny',
        'spacex',
        'spacey',
        'width',
        'height',
        'font_size',
        'custom_x',
        'custom_y',
        'active'
    ];
}
