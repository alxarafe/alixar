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
use Dolibarr\Code\User\Model\User;
use Dolibarr\Core\Base\Model;
use Illuminate\Database\Eloquent\Collection;

/**
 * Class HrmSkill
 *
 * @property int $rowid
 * @property string|null $label
 * @property string|null $description
 * @property Carbon $date_creation
 * @property Carbon|null $tms
 * @property int $fk_user_creat
 * @property int|null $fk_user_modif
 * @property int $required_level
 * @property int $date_validite
 * @property float $temps_theorique
 * @property int $skill_type
 * @property string|null $note_public
 * @property string|null $note_private
 *
 * @property User $user
 * @property Collection|HrmSkilldet[] $hrm_skilldets
 * @property Collection|HrmSkillrank[] $hrm_skillranks
 */
class HrmSkill extends Model
{
    public $timestamps = false;
    protected $table = 'hrm_skill';
    protected $casts = [
        'date_creation' => 'datetime',
        'tms' => 'datetime',
        'fk_user_creat' => 'int',
        'fk_user_modif' => 'int',
        'required_level' => 'int',
        'date_validite' => 'int',
        'temps_theorique' => 'float',
        'skill_type' => 'int'
    ];

    protected $fillable = [
        'label',
        'description',
        'date_creation',
        'tms',
        'fk_user_creat',
        'fk_user_modif',
        'required_level',
        'date_validite',
        'temps_theorique',
        'skill_type',
        'note_public',
        'note_private'
    ];

    public function user()
    {
        return $this->belongsTo(User::class, 'fk_user_creat');
    }

    public function hrm_skilldets()
    {
        return $this->hasMany(HrmSkilldet::class, 'fk_skill');
    }

    public function hrm_skillranks()
    {
        return $this->hasMany(HrmSkillrank::class, 'fk_skill');
    }
}
