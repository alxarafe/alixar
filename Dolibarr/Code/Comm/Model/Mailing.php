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

namespace Dolibarr\Code\Comm\Model;

use Carbon\Carbon;
use Dolibarr\Core\Base\Model;

/**
 * Class Mailing
 *
 * @property int $rowid
 * @property string|null $messtype
 * @property string|null $titre
 * @property int $entity
 * @property string|null $sujet
 * @property string|null $body
 * @property string|null $bgcolor
 * @property string|null $bgimage
 * @property int|null $evenunsubscribe
 * @property string|null $cible
 * @property int|null $nbemail
 * @property string|null $email_from
 * @property string|null $name_from
 * @property string|null $email_replyto
 * @property string|null $email_errorsto
 * @property string|null $tag
 * @property Carbon|null $date_creat
 * @property Carbon|null $date_valid
 * @property Carbon|null $date_appro
 * @property Carbon|null $date_envoi
 * @property Carbon|null $tms
 * @property int|null $fk_user_creat
 * @property int|null $fk_user_modif
 * @property int|null $fk_user_valid
 * @property int|null $fk_user_appro
 * @property string|null $extraparams
 * @property string|null $joined_file1
 * @property string|null $joined_file2
 * @property string|null $joined_file3
 * @property string|null $joined_file4
 * @property int|null $statut
 * @property string|null $note_private
 * @property string|null $note_public
 */
class Mailing extends Model
{
    public $timestamps = false;
    protected $table = 'mailing';
    protected $casts = [
        'entity' => 'int',
        'evenunsubscribe' => 'int',
        'nbemail' => 'int',
        'date_creat' => 'datetime',
        'date_valid' => 'datetime',
        'date_appro' => 'datetime',
        'date_envoi' => 'datetime',
        'tms' => 'datetime',
        'fk_user_creat' => 'int',
        'fk_user_modif' => 'int',
        'fk_user_valid' => 'int',
        'fk_user_appro' => 'int',
        'statut' => 'int'
    ];

    protected $fillable = [
        'messtype',
        'titre',
        'entity',
        'sujet',
        'body',
        'bgcolor',
        'bgimage',
        'evenunsubscribe',
        'cible',
        'nbemail',
        'email_from',
        'name_from',
        'email_replyto',
        'email_errorsto',
        'tag',
        'date_creat',
        'date_valid',
        'date_appro',
        'date_envoi',
        'tms',
        'fk_user_creat',
        'fk_user_modif',
        'fk_user_valid',
        'fk_user_appro',
        'extraparams',
        'joined_file1',
        'joined_file2',
        'joined_file3',
        'joined_file4',
        'statut',
        'note_private',
        'note_public'
    ];
}
