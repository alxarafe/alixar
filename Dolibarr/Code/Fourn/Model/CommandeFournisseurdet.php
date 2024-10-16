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

namespace Dolibarr\Code\Fourn\Model;

use Carbon\Carbon;
use Dolibarr\Code\Commande\Model\Commandedet;
use Dolibarr\Core\Base\Model;
use Dolibarr\Core\Model\CUnit;
use Illuminate\Database\Eloquent\Collection;

/**
 * Class CommandeFournisseurdet
 *
 * @property int $rowid
 * @property int $fk_commande
 * @property int|null $fk_parent_line
 * @property int|null $fk_product
 * @property string|null $ref
 * @property string|null $label
 * @property string|null $description
 * @property string|null $vat_src_code
 * @property float|null $tva_tx
 * @property float|null $localtax1_tx
 * @property string|null $localtax1_type
 * @property float|null $localtax2_tx
 * @property string|null $localtax2_type
 * @property float|null $qty
 * @property float|null $remise_percent
 * @property float|null $remise
 * @property float|null $subprice
 * @property float|null $total_ht
 * @property float|null $total_tva
 * @property float|null $total_localtax1
 * @property float|null $total_localtax2
 * @property float|null $total_ttc
 * @property int|null $product_type
 * @property Carbon|null $date_start
 * @property Carbon|null $date_end
 * @property int|null $info_bits
 * @property int|null $special_code
 * @property int|null $rang
 * @property string|null $import_key
 * @property int|null $fk_unit
 * @property int|null $fk_multicurrency
 * @property string|null $multicurrency_code
 * @property float|null $multicurrency_subprice
 * @property float|null $multicurrency_total_ht
 * @property float|null $multicurrency_total_tva
 * @property float|null $multicurrency_total_ttc
 *
 * @property CUnit|null $c_unit
 * @property Collection|Commandedet[] $commandedets
 */
class CommandeFournisseurdet extends Model
{
    public $timestamps = false;
    protected $table = 'commande_fournisseurdet';
    protected $casts = [
        'fk_commande' => 'int',
        'fk_parent_line' => 'int',
        'fk_product' => 'int',
        'tva_tx' => 'float',
        'localtax1_tx' => 'float',
        'localtax2_tx' => 'float',
        'qty' => 'float',
        'remise_percent' => 'float',
        'remise' => 'float',
        'subprice' => 'float',
        'total_ht' => 'float',
        'total_tva' => 'float',
        'total_localtax1' => 'float',
        'total_localtax2' => 'float',
        'total_ttc' => 'float',
        'product_type' => 'int',
        'date_start' => 'datetime',
        'date_end' => 'datetime',
        'info_bits' => 'int',
        'special_code' => 'int',
        'rang' => 'int',
        'fk_unit' => 'int',
        'fk_multicurrency' => 'int',
        'multicurrency_subprice' => 'float',
        'multicurrency_total_ht' => 'float',
        'multicurrency_total_tva' => 'float',
        'multicurrency_total_ttc' => 'float'
    ];

    protected $fillable = [
        'fk_commande',
        'fk_parent_line',
        'fk_product',
        'ref',
        'label',
        'description',
        'vat_src_code',
        'tva_tx',
        'localtax1_tx',
        'localtax1_type',
        'localtax2_tx',
        'localtax2_type',
        'qty',
        'remise_percent',
        'remise',
        'subprice',
        'total_ht',
        'total_tva',
        'total_localtax1',
        'total_localtax2',
        'total_ttc',
        'product_type',
        'date_start',
        'date_end',
        'info_bits',
        'special_code',
        'rang',
        'import_key',
        'fk_unit',
        'fk_multicurrency',
        'multicurrency_code',
        'multicurrency_subprice',
        'multicurrency_total_ht',
        'multicurrency_total_tva',
        'multicurrency_total_ttc'
    ];

    public function c_unit()
    {
        return $this->belongsTo(CUnit::class, 'fk_unit');
    }

    public function commandedets()
    {
        return $this->hasMany(Commandedet::class, 'fk_commandefourndet');
    }
}
