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

namespace Dolibarr\Code\Compta\Model;

use Carbon\Carbon;
use Dolibarr\Core\Base\Model;
use Illuminate\Database\Eloquent\Collection;

/**
 * Class Paiement
 *
 * @property int $rowid
 * @property string|null $ref
 * @property string|null $ref_ext
 * @property int $entity
 * @property Carbon|null $datec
 * @property Carbon|null $tms
 * @property Carbon|null $datep
 * @property float|null $amount
 * @property float|null $multicurrency_amount
 * @property int $fk_paiement
 * @property string|null $num_paiement
 * @property string|null $note
 * @property string|null $ext_payment_id
 * @property string|null $ext_payment_site
 * @property int $fk_bank
 * @property int|null $fk_user_creat
 * @property int|null $fk_user_modif
 * @property int $statut
 * @property int $fk_export_compta
 * @property float|null $pos_change
 *
 * @property Collection|Facture[] $factures
 */
class Paiement extends Model
{
    public $timestamps = false;
    protected $table = 'paiement';
    protected $casts = [
        'entity' => 'int',
        'datec' => 'datetime',
        'tms' => 'datetime',
        'datep' => 'datetime',
        'amount' => 'float',
        'multicurrency_amount' => 'float',
        'fk_paiement' => 'int',
        'fk_bank' => 'int',
        'fk_user_creat' => 'int',
        'fk_user_modif' => 'int',
        'statut' => 'int',
        'fk_export_compta' => 'int',
        'pos_change' => 'float'
    ];

    protected $fillable = [
        'ref',
        'ref_ext',
        'entity',
        'datec',
        'tms',
        'datep',
        'amount',
        'multicurrency_amount',
        'fk_paiement',
        'num_paiement',
        'note',
        'ext_payment_id',
        'ext_payment_site',
        'fk_bank',
        'fk_user_creat',
        'fk_user_modif',
        'statut',
        'fk_export_compta',
        'pos_change'
    ];

    public function factures()
    {
        return $this->belongsToMany(Facture::class, 'alx_paiement_facture', 'fk_paiement', 'fk_facture')
            ->withPivot('rowid', 'amount', 'multicurrency_code', 'multicurrency_tx', 'multicurrency_amount');
    }
}
