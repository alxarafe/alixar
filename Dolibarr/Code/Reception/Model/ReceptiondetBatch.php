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

namespace Dolibarr\Code\Reception\Model;

use Carbon\Carbon;
use Dolibarr\Core\Base\Model;

/**
 * Class ReceptiondetBatch
 *
 * @property int $rowid
 * @property int|null $fk_reception
 * @property int|null $fk_element
 * @property int|null $fk_elementdet
 * @property string $element_type
 * @property int|null $fk_product
 * @property float|null $qty
 * @property int|null $fk_entrepot
 * @property int|null $fk_projet
 * @property string|null $comment
 * @property string|null $batch
 * @property Carbon|null $eatby
 * @property Carbon|null $sellby
 * @property int|null $status
 * @property int|null $fk_user
 * @property Carbon|null $datec
 * @property Carbon|null $tms
 * @property float|null $cost_price
 *
 * @property Reception|null $reception
 */
class ReceptiondetBatch extends Model
{
    public $timestamps = false;
    protected $table = 'receptiondet_batch';
    protected $casts = [
        'fk_reception' => 'int',
        'fk_element' => 'int',
        'fk_elementdet' => 'int',
        'fk_product' => 'int',
        'qty' => 'float',
        'fk_entrepot' => 'int',
        'fk_projet' => 'int',
        'eatby' => 'datetime',
        'sellby' => 'datetime',
        'status' => 'int',
        'fk_user' => 'int',
        'datec' => 'datetime',
        'tms' => 'datetime',
        'cost_price' => 'float'
    ];

    protected $fillable = [
        'fk_reception',
        'fk_element',
        'fk_elementdet',
        'element_type',
        'fk_product',
        'qty',
        'fk_entrepot',
        'fk_projet',
        'comment',
        'batch',
        'eatby',
        'sellby',
        'status',
        'fk_user',
        'datec',
        'tms',
        'cost_price'
    ];

    public function reception()
    {
        return $this->belongsTo(Reception::class, 'fk_reception');
    }
}
