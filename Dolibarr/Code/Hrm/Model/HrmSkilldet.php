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

use Dolibarr\Code\User\Model\User;
use Dolibarr\Core\Base\Model;

/**
 * Class HrmSkilldet
 *
 * @property int $rowid
 * @property int $fk_skill
 * @property int $rankorder
 * @property string|null $description
 * @property int $fk_user_creat
 * @property int|null $fk_user_modif
 *
 * @property HrmSkill $hrm_skill
 * @property User $user
 */
class HrmSkilldet extends Model
{
    public $timestamps = false;
    protected $table = 'hrm_skilldet';
    protected $casts = [
        'fk_skill' => 'int',
        'rankorder' => 'int',
        'fk_user_creat' => 'int',
        'fk_user_modif' => 'int'
    ];

    protected $fillable = [
        'fk_skill',
        'rankorder',
        'description',
        'fk_user_creat',
        'fk_user_modif'
    ];

    public function hrm_skill()
    {
        return $this->belongsTo(HrmSkill::class, 'fk_skill');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'fk_user_creat');
    }
}