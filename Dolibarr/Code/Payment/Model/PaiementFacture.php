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

namespace Dolibarr\Code\Payment\Model;

use Dolibarr\Code\Compta\Model\Facture;
use Dolibarr\Code\Compta\Model\Paiement;
use Dolibarr\Core\Base\Model;

/**
 * Class PaiementFacture
 *
 * @property int $rowid
 * @property int|null $fk_paiement
 * @property int|null $fk_facture
 * @property float|null $amount
 * @property string|null $multicurrency_code
 * @property float|null $multicurrency_tx
 * @property float|null $multicurrency_amount
 *
 * @property Facture|null $facture
 * @property Paiement|null $paiement
 */
class PaiementFacture extends Model
{
    public $timestamps = false;
    protected $table = 'paiement_facture';
    protected $casts = [
        'fk_paiement' => 'int',
        'fk_facture' => 'int',
        'amount' => 'float',
        'multicurrency_tx' => 'float',
        'multicurrency_amount' => 'float'
    ];

    protected $fillable = [
        'fk_paiement',
        'fk_facture',
        'amount',
        'multicurrency_code',
        'multicurrency_tx',
        'multicurrency_amount'
    ];

    public function facture()
    {
        return $this->belongsTo(Facture::class, 'fk_facture');
    }

    public function paiement()
    {
        return $this->belongsTo(Paiement::class, 'fk_paiement');
    }
}
