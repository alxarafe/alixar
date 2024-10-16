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

namespace Dolibarr\Code\Hrm\Model;

use Carbon\Carbon;
use Dolibarr\Code\Recruitement\Model\RecruitmentRecruitmentjobposition;
use Dolibarr\Core\Base\Model;
use Illuminate\Database\Eloquent\Collection;

/**
 * Class Establishment
 *
 * @property int $rowid
 * @property int $entity
 * @property string|null $ref
 * @property string $label
 * @property string|null $name
 * @property string|null $address
 * @property string|null $zip
 * @property string|null $town
 * @property int|null $fk_state
 * @property int|null $fk_country
 * @property string|null $profid1
 * @property string|null $profid2
 * @property string|null $profid3
 * @property string|null $phone
 * @property int $fk_user_author
 * @property int|null $fk_user_mod
 * @property Carbon $datec
 * @property Carbon $tms
 * @property int|null $status
 *
 * @property Collection|RecruitmentRecruitmentjobposition[] $recruitment_recruitmentjobpositions
 */
class Establishment extends Model
{
    public $timestamps = false;
    protected $table = 'establishment';
    protected $casts = [
        'entity' => 'int',
        'fk_state' => 'int',
        'fk_country' => 'int',
        'fk_user_author' => 'int',
        'fk_user_mod' => 'int',
        'datec' => 'datetime',
        'tms' => 'datetime',
        'status' => 'int'
    ];

    protected $fillable = [
        'entity',
        'ref',
        'label',
        'name',
        'address',
        'zip',
        'town',
        'fk_state',
        'fk_country',
        'profid1',
        'profid2',
        'profid3',
        'phone',
        'fk_user_author',
        'fk_user_mod',
        'datec',
        'tms',
        'status'
    ];

    public function recruitment_recruitmentjobpositions()
    {
        return $this->hasMany(RecruitmentRecruitmentjobposition::class, 'fk_establishment');
    }
}
