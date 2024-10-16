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
 * Class PrelevementRejet
 *
 * @property int $rowid
 * @property int|null $fk_prelevement_lignes
 * @property Carbon|null $date_rejet
 * @property int|null $motif
 * @property Carbon|null $date_creation
 * @property int|null $fk_user_creation
 * @property string|null $note
 * @property int|null $afacturer
 * @property int|null $fk_facture
 */
class PrelevementRejet extends Model
{
    public $timestamps = false;
    protected $table = 'prelevement_rejet';
    protected $casts = [
        'fk_prelevement_lignes' => 'int',
        'date_rejet' => 'datetime',
        'motif' => 'int',
        'date_creation' => 'datetime',
        'fk_user_creation' => 'int',
        'afacturer' => 'int',
        'fk_facture' => 'int'
    ];

    protected $fillable = [
        'fk_prelevement_lignes',
        'date_rejet',
        'motif',
        'date_creation',
        'fk_user_creation',
        'note',
        'afacturer',
        'fk_facture'
    ];
}
