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
 * Class CDepartement
 *
 * @property int $rowid
 * @property string $code_departement
 * @property int|null $fk_region
 * @property string|null $cheflieu
 * @property int|null $tncc
 * @property string|null $ncc
 * @property string|null $nom
 * @property int $active
 *
 * @property CRegion|null $c_region
 * @property Collection|CZiptown[] $c_ziptowns
 */
class CDepartement extends Model
{
    public $timestamps = false;
    protected $table = 'c_departements';
    protected $casts = [
        'fk_region' => 'int',
        'tncc' => 'int',
        'active' => 'int'
    ];

    protected $fillable = [
        'code_departement',
        'fk_region',
        'cheflieu',
        'tncc',
        'ncc',
        'nom',
        'active'
    ];

    public function c_region()
    {
        return $this->belongsTo(CRegion::class, 'fk_region', 'code_region');
    }

    public function c_ziptowns()
    {
        return $this->hasMany(CZiptown::class, 'fk_county');
    }
}
