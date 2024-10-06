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

use Dolibarr\Core\Base\Model;
use Illuminate\Database\Eloquent\Collection;

/**
 * Class AccountingSystem
 *
 * TODO: Possibly not being used
 *
 * @property int $rowid
 * @property int|null $fk_country
 * @property string $pcg_version
 * @property string $label
 * @property int|null $active
 *
 * @property Collection|AccountingAccount[] $accounting_accounts
 *
 * @package Dolibarr\Code\Compta\Model
 */
class AccountingSystem extends Model
{
    public $timestamps = false;

    protected $table = 'accounting_system';

    protected $casts = [
        'fk_country' => 'int',
        'active' => 'int'
    ];

    protected $fillable = [
        'fk_country',
        'pcg_version',
        'label',
        'active'
    ];

    public function accountingAccounts()
    {
        return $this->hasMany(AccountingAccount::class, 'fk_pcg_version', 'pcg_version');
    }
}
