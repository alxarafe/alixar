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

namespace Dolibarr\Code\Expedition\Model;

use Carbon\Carbon;
use Dolibarr\Core\Base\Model;

/**
 * Class ExpeditiondetBatch
 *
 * @property int $rowid
 * @property int $fk_expeditiondet
 * @property Carbon|null $eatby
 * @property Carbon|null $sellby
 * @property string|null $batch
 * @property float $qty
 * @property int $fk_origin_stock
 * @property int|null $fk_warehouse
 *
 * @property Expeditiondet $expeditiondet
 */
class ExpeditiondetBatch extends Model
{
    public $timestamps = false;
    protected $table = 'expeditiondet_batch';
    protected $casts = [
        'fk_expeditiondet' => 'int',
        'eatby' => 'datetime',
        'sellby' => 'datetime',
        'qty' => 'float',
        'fk_origin_stock' => 'int',
        'fk_warehouse' => 'int'
    ];

    protected $fillable = [
        'fk_expeditiondet',
        'eatby',
        'sellby',
        'batch',
        'qty',
        'fk_origin_stock',
        'fk_warehouse'
    ];

    public function expeditiondet()
    {
        return $this->belongsTo(Expeditiondet::class, 'fk_expeditiondet');
    }
}
