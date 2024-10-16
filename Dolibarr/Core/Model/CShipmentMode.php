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

use Carbon\Carbon;
use Dolibarr\Code\Expedition\Model\Expedition;
use Dolibarr\Code\Reception\Model\Reception;
use Dolibarr\Core\Base\Model;
use Illuminate\Database\Eloquent\Collection;

/**
 * Class CShipmentMode
 *
 * @property int $rowid
 * @property int $entity
 * @property Carbon|null $tms
 * @property string $code
 * @property string $libelle
 * @property string|null $description
 * @property string|null $tracking
 * @property int|null $active
 * @property string|null $module
 *
 * @property Collection|Expedition[] $expeditions
 * @property Collection|Reception[] $receptions
 */
class CShipmentMode extends Model
{
    public $timestamps = false;
    protected $table = 'c_shipment_mode';
    protected $casts = [
        'entity' => 'int',
        'tms' => 'datetime',
        'active' => 'int'
    ];

    protected $fillable = [
        'entity',
        'tms',
        'code',
        'libelle',
        'description',
        'tracking',
        'active',
        'module'
    ];

    public function expeditions()
    {
        return $this->hasMany(Expedition::class, 'fk_shipping_method');
    }

    public function receptions()
    {
        return $this->hasMany(Reception::class, 'fk_shipping_method');
    }
}
