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
 * Class OpensurveySondage
 *
 * @property string $id_sondage
 * @property int $entity
 * @property string|null $commentaires
 * @property string|null $mail_admin
 * @property string|null $nom_admin
 * @property int $fk_user_creat
 * @property string $titre
 * @property Carbon|null $date_fin
 * @property int|null $status
 * @property string $format
 * @property int $mailsonde
 * @property int $allow_comments
 * @property int $allow_spy
 * @property Carbon|null $tms
 * @property string|null $sujet
 */
class OpensurveySondage extends Model
{
    public $incrementing = false;
    public $timestamps = false;
    protected $table = 'opensurvey_sondage';
    protected $primaryKey = 'id_sondage';
    protected $casts = [
        'entity' => 'int',
        'fk_user_creat' => 'int',
        'date_fin' => 'datetime',
        'status' => 'int',
        'mailsonde' => 'int',
        'allow_comments' => 'int',
        'allow_spy' => 'int',
        'tms' => 'datetime'
    ];

    protected $fillable = [
        'entity',
        'commentaires',
        'mail_admin',
        'nom_admin',
        'fk_user_creat',
        'titre',
        'date_fin',
        'status',
        'format',
        'mailsonde',
        'allow_comments',
        'allow_spy',
        'tms',
        'sujet'
    ];
}
