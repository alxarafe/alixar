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

namespace Dolibarr\Code\ExpenseReport\Model;

use Carbon\Carbon;
use Dolibarr\Core\Base\Model;

/**
 * Class ExpensereportDet
 *
 * @property int $rowid
 * @property int $fk_expensereport
 * @property string|null $docnumber
 * @property int $fk_c_type_fees
 * @property int|null $fk_c_exp_tax_cat
 * @property int|null $fk_projet
 * @property string $comments
 * @property int|null $product_type
 * @property float $qty
 * @property float $subprice
 * @property float $value_unit
 * @property float|null $remise_percent
 * @property string|null $vat_src_code
 * @property float|null $tva_tx
 * @property float|null $localtax1_tx
 * @property string|null $localtax1_type
 * @property float|null $localtax2_tx
 * @property string|null $localtax2_type
 * @property float $total_ht
 * @property float $total_tva
 * @property float|null $total_localtax1
 * @property float|null $total_localtax2
 * @property float $total_ttc
 * @property Carbon $date
 * @property int|null $info_bits
 * @property int|null $special_code
 * @property int|null $fk_multicurrency
 * @property string|null $multicurrency_code
 * @property float|null $multicurrency_subprice
 * @property float|null $multicurrency_total_ht
 * @property float|null $multicurrency_total_tva
 * @property float|null $multicurrency_total_ttc
 * @property int|null $fk_facture
 * @property int|null $fk_ecm_files
 * @property int|null $fk_code_ventilation
 * @property int|null $rang
 * @property string|null $import_key
 * @property string|null $rule_warning_message
 */
class ExpensereportDet extends Model
{
    public $timestamps = false;
    protected $table = 'expensereport_det';
    protected $casts = [
        'fk_expensereport' => 'int',
        'fk_c_type_fees' => 'int',
        'fk_c_exp_tax_cat' => 'int',
        'fk_projet' => 'int',
        'product_type' => 'int',
        'qty' => 'float',
        'subprice' => 'float',
        'value_unit' => 'float',
        'remise_percent' => 'float',
        'tva_tx' => 'float',
        'localtax1_tx' => 'float',
        'localtax2_tx' => 'float',
        'total_ht' => 'float',
        'total_tva' => 'float',
        'total_localtax1' => 'float',
        'total_localtax2' => 'float',
        'total_ttc' => 'float',
        'date' => 'datetime',
        'info_bits' => 'int',
        'special_code' => 'int',
        'fk_multicurrency' => 'int',
        'multicurrency_subprice' => 'float',
        'multicurrency_total_ht' => 'float',
        'multicurrency_total_tva' => 'float',
        'multicurrency_total_ttc' => 'float',
        'fk_facture' => 'int',
        'fk_ecm_files' => 'int',
        'fk_code_ventilation' => 'int',
        'rang' => 'int'
    ];

    protected $fillable = [
        'fk_expensereport',
        'docnumber',
        'fk_c_type_fees',
        'fk_c_exp_tax_cat',
        'fk_projet',
        'comments',
        'product_type',
        'qty',
        'subprice',
        'value_unit',
        'remise_percent',
        'vat_src_code',
        'tva_tx',
        'localtax1_tx',
        'localtax1_type',
        'localtax2_tx',
        'localtax2_type',
        'total_ht',
        'total_tva',
        'total_localtax1',
        'total_localtax2',
        'total_ttc',
        'date',
        'info_bits',
        'special_code',
        'fk_multicurrency',
        'multicurrency_code',
        'multicurrency_subprice',
        'multicurrency_total_ht',
        'multicurrency_total_tva',
        'multicurrency_total_ttc',
        'fk_facture',
        'fk_ecm_files',
        'fk_code_ventilation',
        'rang',
        'import_key',
        'rule_warning_message'
    ];
}