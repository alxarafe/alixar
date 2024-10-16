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

namespace Dolibarr\Code\Fourn\Model;

use Carbon\Carbon;
use Dolibarr\Core\Base\Model;

/**
 * Class CommandeFournisseurLog
 *
 * @property int $rowid
 * @property Carbon|null $tms
 * @property Carbon $datelog
 * @property int $fk_commande
 * @property int $fk_statut
 * @property int $fk_user
 * @property string|null $comment
 */
class CommandeFournisseurLog extends Model
{
    public $timestamps = false;
    protected $table = 'commande_fournisseur_log';
    protected $casts = [
        'tms' => 'datetime',
        'datelog' => 'datetime',
        'fk_commande' => 'int',
        'fk_statut' => 'int',
        'fk_user' => 'int'
    ];

    protected $fillable = [
        'tms',
        'datelog',
        'fk_commande',
        'fk_statut',
        'fk_user',
        'comment'
    ];
}
