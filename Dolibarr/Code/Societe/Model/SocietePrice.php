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

namespace Dolibarr\Code\Societe\Model;

use Carbon\Carbon;
use Dolibarr\Core\Base\Model;

/**
 * Class SocietePrice
 *
 * @property int $rowid
 * @property int|null $fk_soc
 * @property Carbon|null $tms
 * @property Carbon|null $datec
 * @property int|null $fk_user_author
 * @property int|null $price_level
 */
class SocietePrice extends Model
{
    public $timestamps = false;
    protected $table = 'societe_prices';
    protected $casts = [
        'fk_soc' => 'int',
        'tms' => 'datetime',
        'datec' => 'datetime',
        'fk_user_author' => 'int',
        'price_level' => 'int'
    ];

    protected $fillable = [
        'fk_soc',
        'tms',
        'datec',
        'fk_user_author',
        'price_level'
    ];
}
