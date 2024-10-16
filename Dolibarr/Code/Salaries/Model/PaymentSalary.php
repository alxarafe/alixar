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

namespace Dolibarr\Code\Salaries\Model;

use Carbon\Carbon;
use Dolibarr\Code\User\Model\User;
use Dolibarr\Core\Base\Model;

/**
 * Class PaymentSalary
 *
 * @property int $rowid
 * @property string|null $ref
 * @property Carbon|null $tms
 * @property Carbon|null $datec
 * @property int|null $fk_user
 * @property Carbon|null $datep
 * @property Carbon|null $datev
 * @property float|null $salary
 * @property float $amount
 * @property int|null $fk_projet
 * @property int $fk_typepayment
 * @property string|null $num_payment
 * @property string|null $label
 * @property Carbon|null $datesp
 * @property Carbon|null $dateep
 * @property int $entity
 * @property string|null $note
 * @property int|null $fk_bank
 * @property int|null $fk_user_author
 * @property int|null $fk_user_modif
 * @property int|null $fk_salary
 *
 * @property User|null $user
 */
class PaymentSalary extends Model
{
    public $timestamps = false;
    protected $table = 'payment_salary';
    protected $casts = [
        'tms' => 'datetime',
        'datec' => 'datetime',
        'fk_user' => 'int',
        'datep' => 'datetime',
        'datev' => 'datetime',
        'salary' => 'float',
        'amount' => 'float',
        'fk_projet' => 'int',
        'fk_typepayment' => 'int',
        'datesp' => 'datetime',
        'dateep' => 'datetime',
        'entity' => 'int',
        'fk_bank' => 'int',
        'fk_user_author' => 'int',
        'fk_user_modif' => 'int',
        'fk_salary' => 'int'
    ];

    protected $fillable = [
        'ref',
        'tms',
        'datec',
        'fk_user',
        'datep',
        'datev',
        'salary',
        'amount',
        'fk_projet',
        'fk_typepayment',
        'num_payment',
        'label',
        'datesp',
        'dateep',
        'entity',
        'note',
        'fk_bank',
        'fk_user_author',
        'fk_user_modif',
        'fk_salary'
    ];

    public function user()
    {
        return $this->belongsTo(User::class, 'fk_user');
    }
}
