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

use Carbon\Carbon;
use Dolibarr\Core\Base\Model;

/**
 * Class Paiementfourn
 *
 * @property int $rowid
 * @property string|null $ref
 * @property int|null $entity
 * @property Carbon|null $tms
 * @property Carbon|null $datec
 * @property Carbon|null $datep
 * @property float|null $amount
 * @property float|null $multicurrency_amount
 * @property int|null $fk_user_author
 * @property int|null $fk_user_modif
 * @property int $fk_paiement
 * @property string|null $num_paiement
 * @property string|null $note
 * @property int $fk_bank
 * @property int $statut
 * @property string|null $model_pdf
 */
class Paiementfourn extends Model
{
    public $timestamps = false;
    protected $table = 'paiementfourn';
    protected $casts = [
        'entity' => 'int',
        'tms' => 'datetime',
        'datec' => 'datetime',
        'datep' => 'datetime',
        'amount' => 'float',
        'multicurrency_amount' => 'float',
        'fk_user_author' => 'int',
        'fk_user_modif' => 'int',
        'fk_paiement' => 'int',
        'fk_bank' => 'int',
        'statut' => 'int'
    ];

    protected $fillable = [
        'ref',
        'entity',
        'tms',
        'datec',
        'datep',
        'amount',
        'multicurrency_amount',
        'fk_user_author',
        'fk_user_modif',
        'fk_paiement',
        'num_paiement',
        'note',
        'fk_bank',
        'statut',
        'model_pdf'
    ];
}
