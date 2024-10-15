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
 * Class BankUrl
 *
 * @property int $rowid
 * @property int|null $fk_bank
 * @property int|null $url_id
 * @property string|null $url
 * @property string|null $label
 * @property string $type
 */
class BankUrl extends Model
{
    public $timestamps = false;
    protected $table = 'bank_url';
    protected $casts = [
        'fk_bank' => 'int',
        'url_id' => 'int'
    ];

    protected $fillable = [
        'fk_bank',
        'url_id',
        'url',
        'label',
        'type'
    ];
}
