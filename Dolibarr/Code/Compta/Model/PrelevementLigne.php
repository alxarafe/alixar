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
 * Class PrelevementLigne
 *
 * @property int $rowid
 * @property int|null $fk_prelevement_bons
 * @property int $fk_soc
 * @property int|null $fk_user
 * @property int|null $statut
 * @property string|null $client_nom
 * @property float|null $amount
 * @property string|null $code_banque
 * @property string|null $code_guichet
 * @property string|null $number
 * @property string|null $cle_rib
 * @property string|null $note
 * @property Carbon|null $tms
 *
 * @property PrelevementBon|null $prelevement_bon
 * @property Collection|Prelevement[] $prelevements
 */
class PrelevementLigne extends Model
{
    public $timestamps = false;
    protected $table = 'prelevement_lignes';
    protected $casts = [
        'fk_prelevement_bons' => 'int',
        'fk_soc' => 'int',
        'fk_user' => 'int',
        'statut' => 'int',
        'amount' => 'float',
        'tms' => 'datetime'
    ];

    protected $fillable = [
        'fk_prelevement_bons',
        'fk_soc',
        'fk_user',
        'statut',
        'client_nom',
        'amount',
        'code_banque',
        'code_guichet',
        'number',
        'cle_rib',
        'note',
        'tms'
    ];

    public function prelevement_bon()
    {
        return $this->belongsTo(PrelevementBon::class, 'fk_prelevement_bons');
    }

    public function prelevements()
    {
        return $this->hasMany(Prelevement::class, 'fk_prelevement_lignes');
    }
}
