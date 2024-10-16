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

namespace Dolibarr\Code\Accountancy\Model;

use Dolibarr\Core\Base\Model;

/**
 * Class CAccountingCategory
 *
 * @property int $rowid
 * @property int $entity
 * @property string $code
 * @property string $label
 * @property string $range_account
 * @property int $sens
 * @property int $category_type
 * @property string $formula
 * @property int|null $position
 * @property int|null $fk_country
 * @property int|null $active
 */
class CAccountingCategory extends Model
{
    public $timestamps = false;
    protected $table = 'c_accounting_category';
    protected $casts = [
        'entity' => 'int',
        'sens' => 'int',
        'category_type' => 'int',
        'position' => 'int',
        'fk_country' => 'int',
        'active' => 'int'
    ];

    protected $fillable = [
        'entity',
        'code',
        'label',
        'range_account',
        'sens',
        'category_type',
        'formula',
        'position',
        'fk_country',
        'active'
    ];
}
