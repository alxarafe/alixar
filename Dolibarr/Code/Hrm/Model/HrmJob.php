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
 * Class HrmJob
 *
 * @property int $rowid
 * @property string $label
 * @property string|null $description
 * @property Carbon $date_creation
 * @property Carbon|null $tms
 * @property string|null $deplacement
 * @property string|null $note_public
 * @property string|null $note_private
 * @property int|null $fk_user_creat
 * @property int|null $fk_user_modif
 */
class HrmJob extends Model
{
    public $timestamps = false;
    protected $table = 'hrm_job';
    protected $casts = [
        'date_creation' => 'datetime',
        'tms' => 'datetime',
        'fk_user_creat' => 'int',
        'fk_user_modif' => 'int'
    ];

    protected $fillable = [
        'label',
        'description',
        'date_creation',
        'tms',
        'deplacement',
        'note_public',
        'note_private',
        'fk_user_creat',
        'fk_user_modif'
    ];
}
