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
 * Class AccountingAccount
 *
 * @property int $rowid
 * @property int $entity
 * @property Carbon|null $datec
 * @property Carbon|null $tms
 * @property string $fk_pcg_version
 * @property string $pcg_type
 * @property string $account_number
 * @property int|null $account_parent
 * @property string $label
 * @property string|null $labelshort
 * @property int|null $fk_accounting_category
 * @property int|null $fk_user_author
 * @property int|null $fk_user_modif
 * @property int $active
 * @property int $reconcilable
 * @property string|null $import_key
 * @property string|null $extraparams
 *
 * @property AccountingSystem $accounting_system
 *
 * @package Dolibarr\Code\Compta\Model
 */
class AccountingAccount extends Model
{
    public $timestamps = false;

    protected $table = 'accounting_account';

    protected $casts = [
        'entity' => 'int',
        'datec' => 'datetime',
        'tms' => 'datetime',
        'account_parent' => 'int',
        'fk_accounting_category' => 'int',
        'fk_user_author' => 'int',
        'fk_user_modif' => 'int',
        'active' => 'int',
        'reconcilable' => 'int'
    ];

    protected $fillable = [
        'entity',
        'datec',
        'tms',
        'fk_pcg_version',
        'pcg_type',
        'account_number',
        'account_parent',
        'label',
        'labelshort',
        'fk_accounting_category',
        'fk_user_author',
        'fk_user_modif',
        'active',
        'reconcilable',
        'import_key',
        'extraparams'
    ];

    public function accountingSystem()
    {
        return $this->belongsTo(AccountingSystem::class, 'fk_pcg_version', 'pcg_version');
    }
}
