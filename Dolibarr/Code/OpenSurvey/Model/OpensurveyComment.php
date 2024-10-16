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

namespace Dolibarr\Code\OpenSurvey\Model;

use Carbon\Carbon;
use Dolibarr\Core\Base\Model;

/**
 * Class OpensurveyComment
 *
 * @property int $id_comment
 * @property string $id_sondage
 * @property string $comment
 * @property Carbon|null $tms
 * @property string|null $usercomment
 * @property Carbon $date_creation
 * @property string|null $ip
 */
class OpensurveyComment extends Model
{
    public $timestamps = false;
    protected $table = 'opensurvey_comments';
    protected $primaryKey = 'id_comment';
    protected $casts = [
        'tms' => 'datetime',
        'date_creation' => 'datetime'
    ];

    protected $fillable = [
        'id_sondage',
        'comment',
        'tms',
        'usercomment',
        'date_creation',
        'ip'
    ];
}
