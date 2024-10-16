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
 * Class CRevenuestamp
 *
 * @property int $rowid
 * @property int $fk_pays
 * @property float $taux
 * @property string $revenuestamp_type
 * @property string|null $note
 * @property int $active
 * @property string|null $accountancy_code_sell
 * @property string|null $accountancy_code_buy
 */
class CRevenuestamp extends Model
{
    public $timestamps = false;
    protected $table = 'c_revenuestamp';
    protected $casts = [
        'fk_pays' => 'int',
        'taux' => 'float',
        'active' => 'int'
    ];

    protected $fillable = [
        'fk_pays',
        'taux',
        'revenuestamp_type',
        'note',
        'active',
        'accountancy_code_sell',
        'accountancy_code_buy'
    ];
}
