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

use Dolibarr\Core\Base\Model;
use Illuminate\Database\Eloquent\Collection;

/**
 * Class Expeditiondet
 *
 * @property int $rowid
 * @property int $fk_expedition
 * @property int|null $fk_element
 * @property int|null $fk_elementdet
 * @property string $element_type
 * @property int|null $fk_product
 * @property float|null $qty
 * @property int|null $fk_entrepot
 * @property int|null $rang
 *
 * @property Expedition $expedition
 * @property Collection|ExpeditiondetBatch[] $expeditiondet_batches
 */
class Expeditiondet extends Model
{
    public $timestamps = false;
    protected $table = 'expeditiondet';
    protected $casts = [
        'fk_expedition' => 'int',
        'fk_element' => 'int',
        'fk_elementdet' => 'int',
        'fk_product' => 'int',
        'qty' => 'float',
        'fk_entrepot' => 'int',
        'rang' => 'int'
    ];

    protected $fillable = [
        'fk_expedition',
        'fk_element',
        'fk_elementdet',
        'element_type',
        'fk_product',
        'qty',
        'fk_entrepot',
        'rang'
    ];

    public function expedition()
    {
        return $this->belongsTo(Expedition::class, 'fk_expedition');
    }

    public function expeditiondet_batches()
    {
        return $this->hasMany(ExpeditiondetBatch::class, 'fk_expeditiondet');
    }
}
