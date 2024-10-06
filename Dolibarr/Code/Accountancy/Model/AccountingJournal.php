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

use App\Models\BankAccount;
use Dolibarr\Core\Base\Model;
use Illuminate\Database\Eloquent\Collection;

/**
 * Class AccountingJournal
 *
 * @property int $rowid
 * @property int $entity
 * @property string $code
 * @property string $label
 * @property int $nature
 * @property int|null $active
 *
 * @property Collection|BankAccount[] $bank_accounts
 *
 * @package Dolibarr\Code\Accountancy\Model
 */
class AccountingJournal extends Model
{
    public $timestamps = false;

    protected $table = 'accounting_journal';

    protected $casts = [
        'entity' => 'int',
        'nature' => 'int',
        'active' => 'int'
    ];

    protected $fillable = [
        'entity',
        'code',
        'label',
        'nature',
        'active'
    ];

    public function bankAccounts()
    {
        return $this->hasMany(BankAccount::class, 'fk_accountancy_journal');
    }
}
