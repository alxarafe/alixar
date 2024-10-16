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

namespace Dolibarr\Code\Adherents\Model;

use Carbon\Carbon;
use Dolibarr\Core\Base\Model;
use Illuminate\Database\Eloquent\Collection;

/**
 * Class AdherentType
 *
 * @property int $rowid
 * @property int $entity
 * @property Carbon|null $tms
 * @property int $statut
 * @property string $libelle
 * @property string $morphy
 * @property string|null $duration
 * @property string $subscription
 * @property float|null $amount
 * @property int|null $caneditamount
 * @property string $vote
 * @property string|null $note
 * @property string|null $mail_valid
 *
 * @property Collection|Adherent[] $adherents
 */
class AdherentType extends Model
{
    public $timestamps = false;
    protected $table = 'adherent_type';
    protected $casts = [
        'entity' => 'int',
        'tms' => 'datetime',
        'statut' => 'int',
        'amount' => 'float',
        'caneditamount' => 'int'
    ];

    protected $fillable = [
        'entity',
        'tms',
        'statut',
        'libelle',
        'morphy',
        'duration',
        'subscription',
        'amount',
        'caneditamount',
        'vote',
        'note',
        'mail_valid'
    ];

    public function adherents()
    {
        return $this->hasMany(Adherent::class, 'fk_adherent_type');
    }
}
