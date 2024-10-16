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
 * Class Expensereport
 *
 * @property int $rowid
 * @property string $ref
 * @property int $entity
 * @property int|null $ref_number_int
 * @property int|null $ref_ext
 * @property float|null $total_ht
 * @property float|null $total_tva
 * @property float|null $localtax1
 * @property float|null $localtax2
 * @property float|null $total_ttc
 * @property Carbon $date_debut
 * @property Carbon $date_fin
 * @property Carbon $date_create
 * @property Carbon|null $date_valid
 * @property Carbon|null $date_approve
 * @property Carbon|null $date_refuse
 * @property Carbon|null $date_cancel
 * @property Carbon|null $tms
 * @property int $fk_user_author
 * @property int|null $fk_user_creat
 * @property int|null $fk_user_modif
 * @property int|null $fk_user_valid
 * @property int|null $fk_user_validator
 * @property int|null $fk_user_approve
 * @property int|null $fk_user_refuse
 * @property int|null $fk_user_cancel
 * @property int $fk_statut
 * @property int|null $fk_c_paiement
 * @property int $paid
 * @property string|null $note_public
 * @property string|null $note_private
 * @property string|null $detail_refuse
 * @property string|null $detail_cancel
 * @property int|null $integration_compta
 * @property int|null $fk_bank_account
 * @property string|null $model_pdf
 * @property string|null $last_main_doc
 * @property int|null $fk_multicurrency
 * @property string|null $multicurrency_code
 * @property float|null $multicurrency_tx
 * @property float|null $multicurrency_total_ht
 * @property float|null $multicurrency_total_tva
 * @property float|null $multicurrency_total_ttc
 * @property string|null $import_key
 * @property string|null $extraparams
 */
class Expensereport extends Model
{
    public $timestamps = false;
    protected $table = 'expensereport';
    protected $casts = [
        'entity' => 'int',
        'ref_number_int' => 'int',
        'ref_ext' => 'int',
        'total_ht' => 'float',
        'total_tva' => 'float',
        'localtax1' => 'float',
        'localtax2' => 'float',
        'total_ttc' => 'float',
        'date_debut' => 'datetime',
        'date_fin' => 'datetime',
        'date_create' => 'datetime',
        'date_valid' => 'datetime',
        'date_approve' => 'datetime',
        'date_refuse' => 'datetime',
        'date_cancel' => 'datetime',
        'tms' => 'datetime',
        'fk_user_author' => 'int',
        'fk_user_creat' => 'int',
        'fk_user_modif' => 'int',
        'fk_user_valid' => 'int',
        'fk_user_validator' => 'int',
        'fk_user_approve' => 'int',
        'fk_user_refuse' => 'int',
        'fk_user_cancel' => 'int',
        'fk_statut' => 'int',
        'fk_c_paiement' => 'int',
        'paid' => 'int',
        'integration_compta' => 'int',
        'fk_bank_account' => 'int',
        'fk_multicurrency' => 'int',
        'multicurrency_tx' => 'float',
        'multicurrency_total_ht' => 'float',
        'multicurrency_total_tva' => 'float',
        'multicurrency_total_ttc' => 'float'
    ];

    protected $fillable = [
        'ref',
        'entity',
        'ref_number_int',
        'ref_ext',
        'total_ht',
        'total_tva',
        'localtax1',
        'localtax2',
        'total_ttc',
        'date_debut',
        'date_fin',
        'date_create',
        'date_valid',
        'date_approve',
        'date_refuse',
        'date_cancel',
        'tms',
        'fk_user_author',
        'fk_user_creat',
        'fk_user_modif',
        'fk_user_valid',
        'fk_user_validator',
        'fk_user_approve',
        'fk_user_refuse',
        'fk_user_cancel',
        'fk_statut',
        'fk_c_paiement',
        'paid',
        'note_public',
        'note_private',
        'detail_refuse',
        'detail_cancel',
        'integration_compta',
        'fk_bank_account',
        'model_pdf',
        'last_main_doc',
        'fk_multicurrency',
        'multicurrency_code',
        'multicurrency_tx',
        'multicurrency_total_ht',
        'multicurrency_total_tva',
        'multicurrency_total_ttc',
        'import_key',
        'extraparams'
    ];
}
