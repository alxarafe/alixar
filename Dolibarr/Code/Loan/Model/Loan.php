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

namespace Dolibarr\Code\Loan\Model;

use Carbon\Carbon;
use Dolibarr\Core\Base\Model;

/**
 * Class Loan
 *
 * @property int $rowid
 * @property int $entity
 * @property Carbon|null $datec
 * @property Carbon|null $tms
 * @property string $label
 * @property int|null $fk_bank
 * @property float $capital
 * @property float|null $insurance_amount
 * @property Carbon|null $datestart
 * @property Carbon|null $dateend
 * @property float|null $nbterm
 * @property float $rate
 * @property string|null $note_private
 * @property string|null $note_public
 * @property float|null $capital_position
 * @property Carbon|null $date_position
 * @property int $paid
 * @property string|null $accountancy_account_capital
 * @property string|null $accountancy_account_insurance
 * @property string|null $accountancy_account_interest
 * @property int|null $fk_projet
 * @property int|null $fk_user_author
 * @property int|null $fk_user_modif
 * @property int $active
 */
class Loan extends Model
{
    public $timestamps = false;
    protected $table = 'loan';
    protected $casts = [
        'entity' => 'int',
        'datec' => 'datetime',
        'tms' => 'datetime',
        'fk_bank' => 'int',
        'capital' => 'float',
        'insurance_amount' => 'float',
        'datestart' => 'datetime',
        'dateend' => 'datetime',
        'nbterm' => 'float',
        'rate' => 'float',
        'capital_position' => 'float',
        'date_position' => 'datetime',
        'paid' => 'int',
        'fk_projet' => 'int',
        'fk_user_author' => 'int',
        'fk_user_modif' => 'int',
        'active' => 'int'
    ];

    protected $fillable = [
        'entity',
        'datec',
        'tms',
        'label',
        'fk_bank',
        'capital',
        'insurance_amount',
        'datestart',
        'dateend',
        'nbterm',
        'rate',
        'note_private',
        'note_public',
        'capital_position',
        'date_position',
        'paid',
        'accountancy_account_capital',
        'accountancy_account_insurance',
        'accountancy_account_interest',
        'fk_projet',
        'fk_user_author',
        'fk_user_modif',
        'active'
    ];
}
