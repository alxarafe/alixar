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

/**
 * Class Subscription
 *
 * @property int $rowid
 * @property Carbon|null $tms
 * @property Carbon|null $datec
 * @property int|null $fk_adherent
 * @property int|null $fk_type
 * @property Carbon|null $dateadh
 * @property Carbon|null $datef
 * @property float|null $subscription
 * @property int|null $fk_bank
 * @property int|null $fk_user_creat
 * @property int|null $fk_user_valid
 * @property string|null $note
 */
class Subscription extends Model
{
    public $timestamps = false;
    protected $table = 'subscription';
    protected $casts = [
        'tms' => 'datetime',
        'datec' => 'datetime',
        'fk_adherent' => 'int',
        'fk_type' => 'int',
        'dateadh' => 'datetime',
        'datef' => 'datetime',
        'subscription' => 'float',
        'fk_bank' => 'int',
        'fk_user_creat' => 'int',
        'fk_user_valid' => 'int'
    ];

    protected $fillable = [
        'tms',
        'datec',
        'fk_adherent',
        'fk_type',
        'dateadh',
        'datef',
        'subscription',
        'fk_bank',
        'fk_user_creat',
        'fk_user_valid',
        'note'
    ];
}
