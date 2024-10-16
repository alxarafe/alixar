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
 * Class CTva
 *
 * @property int $rowid
 * @property int $entity
 * @property int $fk_pays
 * @property int $type_vat
 * @property string|null $code
 * @property float $taux
 * @property string $localtax1
 * @property string $localtax1_type
 * @property string $localtax2
 * @property string $localtax2_type
 * @property int|null $use_default
 * @property int $recuperableonly
 * @property string|null $note
 * @property int $active
 * @property string|null $accountancy_code_sell
 * @property string|null $accountancy_code_buy
 */
class CTva extends Model
{
    public $timestamps = false;
    protected $table = 'c_tva';
    protected $casts = [
        'entity' => 'int',
        'fk_pays' => 'int',
        'type_vat' => 'int',
        'taux' => 'float',
        'use_default' => 'int',
        'recuperableonly' => 'int',
        'active' => 'int'
    ];

    protected $fillable = [
        'entity',
        'fk_pays',
        'type_vat',
        'code',
        'taux',
        'localtax1',
        'localtax1_type',
        'localtax2',
        'localtax2_type',
        'use_default',
        'recuperableonly',
        'note',
        'active',
        'accountancy_code_sell',
        'accountancy_code_buy'
    ];
}
