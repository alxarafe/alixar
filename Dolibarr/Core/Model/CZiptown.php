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
 * Class CZiptown
 *
 * @property int $rowid
 * @property string|null $code
 * @property int|null $fk_county
 * @property int $fk_pays
 * @property string $zip
 * @property string $town
 * @property string|null $town_up
 * @property int $active
 *
 * @property CDepartement|null $c_departement
 * @property CCountry $c_country
 */
class CZiptown extends Model
{
    public $timestamps = false;
    protected $table = 'c_ziptown';
    protected $casts = [
        'fk_county' => 'int',
        'fk_pays' => 'int',
        'active' => 'int'
    ];

    protected $fillable = [
        'code',
        'fk_county',
        'fk_pays',
        'zip',
        'town',
        'town_up',
        'active'
    ];

    public function c_departement()
    {
        return $this->belongsTo(CDepartement::class, 'fk_county');
    }

    public function c_country()
    {
        return $this->belongsTo(CCountry::class, 'fk_pays');
    }
}
