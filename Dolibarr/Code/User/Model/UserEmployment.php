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

namespace Dolibarr\Code\User\Model;

use Carbon\Carbon;
use Dolibarr\Core\Base\Model;

/**
 * Class UserEmployment
 *
 * @property int $rowid
 * @property int $entity
 * @property string|null $ref
 * @property string|null $ref_ext
 * @property int|null $fk_user
 * @property Carbon|null $datec
 * @property Carbon|null $tms
 * @property int|null $fk_user_creat
 * @property int|null $fk_user_modif
 * @property string|null $job
 * @property int $status
 * @property float|null $salary
 * @property float|null $salaryextra
 * @property float|null $weeklyhours
 * @property Carbon|null $dateemployment
 * @property Carbon|null $dateemploymentend
 *
 * @property User|null $user
 */
class UserEmployment extends Model
{
    public $timestamps = false;
    protected $table = 'user_employment';
    protected $casts = [
        'entity' => 'int',
        'fk_user' => 'int',
        'datec' => 'datetime',
        'tms' => 'datetime',
        'fk_user_creat' => 'int',
        'fk_user_modif' => 'int',
        'status' => 'int',
        'salary' => 'float',
        'salaryextra' => 'float',
        'weeklyhours' => 'float',
        'dateemployment' => 'datetime',
        'dateemploymentend' => 'datetime'
    ];

    protected $fillable = [
        'entity',
        'ref',
        'ref_ext',
        'fk_user',
        'datec',
        'tms',
        'fk_user_creat',
        'fk_user_modif',
        'job',
        'status',
        'salary',
        'salaryextra',
        'weeklyhours',
        'dateemployment',
        'dateemploymentend'
    ];

    public function user()
    {
        return $this->belongsTo(User::class, 'fk_user');
    }
}
