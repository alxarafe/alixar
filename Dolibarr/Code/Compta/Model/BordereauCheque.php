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

/**
 * Class BordereauCheque
 *
 * @property int $rowid
 * @property string $ref
 * @property string|null $label
 * @property string|null $ref_ext
 * @property string|null $type
 * @property Carbon $datec
 * @property Carbon|null $date_bordereau
 * @property float $amount
 * @property int $nbcheque
 * @property int|null $fk_bank_account
 * @property int|null $fk_user_author
 * @property int $statut
 * @property Carbon|null $tms
 * @property string|null $note
 * @property int $entity
 */
class BordereauCheque extends Model
{
    public $timestamps = false;
    protected $table = 'bordereau_cheque';
    protected $casts = [
        'datec' => 'datetime',
        'date_bordereau' => 'datetime',
        'amount' => 'float',
        'nbcheque' => 'int',
        'fk_bank_account' => 'int',
        'fk_user_author' => 'int',
        'statut' => 'int',
        'tms' => 'datetime',
        'entity' => 'int'
    ];

    protected $fillable = [
        'ref',
        'label',
        'ref_ext',
        'type',
        'datec',
        'date_bordereau',
        'amount',
        'nbcheque',
        'fk_bank_account',
        'fk_user_author',
        'statut',
        'tms',
        'note',
        'entity'
    ];
}
