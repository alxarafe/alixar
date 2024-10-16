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

/**
 * Class HrmEvaluationdet
 *
 * @property int $rowid
 * @property Carbon $date_creation
 * @property Carbon|null $tms
 * @property int $fk_user_creat
 * @property int|null $fk_user_modif
 * @property int $fk_skill
 * @property int $fk_evaluation
 * @property int $rankorder
 * @property int $required_rank
 * @property string|null $comment
 * @property string|null $import_key
 *
 * @property User $user
 */
class HrmEvaluationdet extends Model
{
    public $timestamps = false;
    protected $table = 'hrm_evaluationdet';
    protected $casts = [
        'date_creation' => 'datetime',
        'tms' => 'datetime',
        'fk_user_creat' => 'int',
        'fk_user_modif' => 'int',
        'fk_skill' => 'int',
        'fk_evaluation' => 'int',
        'rankorder' => 'int',
        'required_rank' => 'int'
    ];

    protected $fillable = [
        'date_creation',
        'tms',
        'fk_user_creat',
        'fk_user_modif',
        'fk_skill',
        'fk_evaluation',
        'rankorder',
        'required_rank',
        'comment',
        'import_key'
    ];

    public function user()
    {
        return $this->belongsTo(User::class, 'fk_user_creat');
    }
}
