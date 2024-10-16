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
use Illuminate\Database\Eloquent\Collection;

/**
 * Class CRegion
 *
 * @property int $rowid
 * @property int $code_region
 * @property int $fk_pays
 * @property string|null $cheflieu
 * @property int|null $tncc
 * @property string|null $nom
 * @property int $active
 *
 * @property CCountry $c_country
 * @property Collection|CDepartement[] $c_departements
 */
class CRegion extends Model
{
    public $timestamps = false;
    protected $table = 'c_regions';
    protected $casts = [
        'code_region' => 'int',
        'fk_pays' => 'int',
        'tncc' => 'int',
        'active' => 'int'
    ];

    protected $fillable = [
        'code_region',
        'fk_pays',
        'cheflieu',
        'tncc',
        'nom',
        'active'
    ];

    public function c_country()
    {
        return $this->belongsTo(CCountry::class, 'fk_pays');
    }

    public function c_departements()
    {
        return $this->hasMany(CDepartement::class, 'fk_region', 'code_region');
    }
}
