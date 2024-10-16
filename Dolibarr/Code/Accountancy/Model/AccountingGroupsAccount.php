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

use Dolibarr\Core\Base\Model;

/**
 * Class AccountingGroupsAccount
 *
 * TODO: Possibly not being used
 *
 * @property int $rowid
 * @property int $fk_accounting_account
 * @property int $fk_c_accounting_category
 *
 * @package Dolibarr\Code\Accountancy\Model
 */
class AccountingGroupsAccount extends Model
{
    public $timestamps = false;

    protected $table = 'accounting_groups_account';

    protected $casts = [
        'fk_accounting_account' => 'int',
        'fk_c_accounting_category' => 'int'
    ];

    protected $fillable = [
        'fk_accounting_account',
        'fk_c_accounting_category'
    ];
}
