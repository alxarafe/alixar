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
 * Class CHrmPublicHoliday
 *
 * @property int $id
 * @property int $entity
 * @property int|null $fk_country
 * @property int|null $fk_departement
 * @property string|null $code
 * @property string|null $dayrule
 * @property int|null $day
 * @property int|null $month
 * @property int|null $year
 * @property int|null $active
 * @property string|null $import_key
 */
class CHrmPublicHoliday extends Model
{
    public $timestamps = false;
    protected $table = 'c_hrm_public_holiday';
    protected $casts = [
        'entity' => 'int',
        'fk_country' => 'int',
        'fk_departement' => 'int',
        'day' => 'int',
        'month' => 'int',
        'year' => 'int',
        'active' => 'int'
    ];

    protected $fillable = [
        'entity',
        'fk_country',
        'fk_departement',
        'code',
        'dayrule',
        'day',
        'month',
        'year',
        'active',
        'import_key'
    ];
}
