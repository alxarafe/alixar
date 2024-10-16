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
use Dolibarr\Core\Base\Model;

/**
 * Class HrmJobUser
 *
 * @property int $rowid
 * @property string|null $description
 * @property Carbon $date_creation
 * @property Carbon|null $tms
 * @property int|null $fk_contrat
 * @property int|null $fk_user
 * @property int $fk_job
 * @property Carbon|null $date_start
 * @property Carbon|null $date_end
 * @property string|null $abort_comment
 * @property string|null $note_public
 * @property string|null $note_private
 * @property int|null $fk_user_creat
 * @property int|null $fk_user_modif
 */
class HrmJobUser extends Model
{
    public $timestamps = false;
    protected $table = 'hrm_job_user';
    protected $casts = [
        'date_creation' => 'datetime',
        'tms' => 'datetime',
        'fk_contrat' => 'int',
        'fk_user' => 'int',
        'fk_job' => 'int',
        'date_start' => 'datetime',
        'date_end' => 'datetime',
        'fk_user_creat' => 'int',
        'fk_user_modif' => 'int'
    ];

    protected $fillable = [
        'description',
        'date_creation',
        'tms',
        'fk_contrat',
        'fk_user',
        'fk_job',
        'date_start',
        'date_end',
        'abort_comment',
        'note_public',
        'note_private',
        'fk_user_creat',
        'fk_user_modif'
    ];
}
