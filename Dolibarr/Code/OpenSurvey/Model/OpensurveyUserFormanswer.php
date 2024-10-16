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

use Dolibarr\Core\Base\Model;

/**
 * Class OpensurveyUserFormanswer
 *
 * @property int $fk_user_survey
 * @property int $fk_question
 * @property string|null $reponses
 */
class OpensurveyUserFormanswer extends Model
{
    public $incrementing = false;
    public $timestamps = false;
    protected $table = 'opensurvey_user_formanswers';
    protected $casts = [
        'fk_user_survey' => 'int',
        'fk_question' => 'int'
    ];

    protected $fillable = [
        'fk_user_survey',
        'fk_question',
        'reponses'
    ];
}
