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
 * Class PrelevementBon
 *
 * @property int $rowid
 * @property string|null $type
 * @property string|null $ref
 * @property int $entity
 * @property Carbon|null $datec
 * @property float|null $amount
 * @property int|null $statut
 * @property int|null $credite
 * @property string|null $note
 * @property Carbon|null $date_trans
 * @property int|null $method_trans
 * @property int|null $fk_user_trans
 * @property Carbon|null $date_credit
 * @property int|null $fk_user_credit
 * @property int|null $fk_bank_account
 *
 * @property Collection|PrelevementLigne[] $prelevement_lignes
 */
class PrelevementBon extends Model
{
    public $timestamps = false;
    protected $table = 'prelevement_bons';
    protected $casts = [
        'entity' => 'int',
        'datec' => 'datetime',
        'amount' => 'float',
        'statut' => 'int',
        'credite' => 'int',
        'date_trans' => 'datetime',
        'method_trans' => 'int',
        'fk_user_trans' => 'int',
        'date_credit' => 'datetime',
        'fk_user_credit' => 'int',
        'fk_bank_account' => 'int'
    ];

    protected $fillable = [
        'type',
        'ref',
        'entity',
        'datec',
        'amount',
        'statut',
        'credite',
        'note',
        'date_trans',
        'method_trans',
        'fk_user_trans',
        'date_credit',
        'fk_user_credit',
        'fk_bank_account'
    ];

    public function prelevement_lignes()
    {
        return $this->hasMany(PrelevementLigne::class, 'fk_prelevement_bons');
    }
}
