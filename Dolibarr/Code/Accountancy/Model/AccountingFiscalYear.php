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

namespace Dolibarr\Code\Accountancy\Model;

use Carbon\Carbon;
use Dolibarr\Core\Base\Model;

/**
 * Class AccountingFiscalyear
 *
 * @property int $rowid
 * @property string $label
 * @property Carbon|null $date_start
 * @property Carbon|null $date_end
 * @property int $statut
 * @property int $entity
 * @property Carbon $datec
 * @property Carbon|null $tms
 * @property int|null $fk_user_author
 * @property int|null $fk_user_modif
 *
 * @package Dolibarr\Code\Accountancy\Model
 */
class AccountingFiscalYear extends Model
{
    public $timestamps = false;

    protected $table = 'accounting_fiscalyear';

    protected $casts = [
        'date_start' => 'datetime',
        'date_end' => 'datetime',
        'statut' => 'int',
        'entity' => 'int',
        'datec' => 'datetime',
        'tms' => 'datetime',
        'fk_user_author' => 'int',
        'fk_user_modif' => 'int'
    ];

    protected $fillable = [
        'label',
        'date_start',
        'date_end',
        'statut',
        'entity',
        'datec',
        'tms',
        'fk_user_author',
        'fk_user_modif'
    ];
}
