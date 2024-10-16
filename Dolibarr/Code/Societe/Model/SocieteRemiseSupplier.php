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

namespace Dolibarr\Code\Societe\Model;

use Carbon\Carbon;
use Dolibarr\Core\Base\Model;

/**
 * Class SocieteRemiseSupplier
 *
 * @property int $rowid
 * @property int $entity
 * @property int $fk_soc
 * @property Carbon|null $tms
 * @property Carbon|null $datec
 * @property int|null $fk_user_author
 * @property float $remise_supplier
 * @property string|null $note
 */
class SocieteRemiseSupplier extends Model
{
    public $timestamps = false;
    protected $table = 'societe_remise_supplier';
    protected $casts = [
        'entity' => 'int',
        'fk_soc' => 'int',
        'tms' => 'datetime',
        'datec' => 'datetime',
        'fk_user_author' => 'int',
        'remise_supplier' => 'float'
    ];

    protected $fillable = [
        'entity',
        'fk_soc',
        'tms',
        'datec',
        'fk_user_author',
        'remise_supplier',
        'note'
    ];
}
