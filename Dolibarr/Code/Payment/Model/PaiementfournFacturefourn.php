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

use Dolibarr\Core\Base\Model;

/**
 * Class PaiementfournFacturefourn
 *
 * @property int $rowid
 * @property int|null $fk_paiementfourn
 * @property int|null $fk_facturefourn
 * @property float|null $amount
 * @property string|null $multicurrency_code
 * @property float|null $multicurrency_tx
 * @property float|null $multicurrency_amount
 */
class PaiementfournFacturefourn extends Model
{
    public $timestamps = false;
    protected $table = 'paiementfourn_facturefourn';
    protected $casts = [
        'fk_paiementfourn' => 'int',
        'fk_facturefourn' => 'int',
        'amount' => 'float',
        'multicurrency_tx' => 'float',
        'multicurrency_amount' => 'float'
    ];

    protected $fillable = [
        'fk_paiementfourn',
        'fk_facturefourn',
        'amount',
        'multicurrency_code',
        'multicurrency_tx',
        'multicurrency_amount'
    ];
}
