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

namespace Dolibarr\Code\Mailing\Model;

use Carbon\Carbon;
use Dolibarr\Core\Base\Model;

/**
 * Class MailingCible
 *
 * @property int $rowid
 * @property int $fk_mailing
 * @property int $fk_contact
 * @property string|null $lastname
 * @property string|null $firstname
 * @property string $email
 * @property string|null $other
 * @property string|null $tag
 * @property int $statut
 * @property string|null $source_url
 * @property int|null $source_id
 * @property string|null $source_type
 * @property Carbon|null $date_envoi
 * @property Carbon|null $tms
 * @property string|null $error_text
 */
class MailingCible extends Model
{
    public $timestamps = false;
    protected $table = 'mailing_cibles';
    protected $casts = [
        'fk_mailing' => 'int',
        'fk_contact' => 'int',
        'statut' => 'int',
        'source_id' => 'int',
        'date_envoi' => 'datetime',
        'tms' => 'datetime'
    ];

    protected $fillable = [
        'fk_mailing',
        'fk_contact',
        'lastname',
        'firstname',
        'email',
        'other',
        'tag',
        'statut',
        'source_url',
        'source_id',
        'source_type',
        'date_envoi',
        'tms',
        'error_text'
    ];
}
