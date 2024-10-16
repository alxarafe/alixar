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

namespace Dolibarr\Core\Model;

use Carbon\Carbon;
use Dolibarr\Core\Base\Model;

/**
 * Class OauthToken
 *
 * @property int $rowid
 * @property string|null $service
 * @property string|null $token
 * @property string|null $tokenstring
 * @property string|null $state
 * @property int|null $fk_soc
 * @property int|null $fk_user
 * @property int|null $fk_adherent
 * @property string|null $restricted_ips
 * @property Carbon|null $datec
 * @property Carbon|null $tms
 * @property int|null $entity
 */
class OauthToken extends Model
{
    public $timestamps = false;
    protected $table = 'oauth_token';
    protected $casts = [
        'fk_soc' => 'int',
        'fk_user' => 'int',
        'fk_adherent' => 'int',
        'datec' => 'datetime',
        'tms' => 'datetime',
        'entity' => 'int'
    ];

    protected $hidden = [
        'token'
    ];

    protected $fillable = [
        'service',
        'token',
        'tokenstring',
        'state',
        'fk_soc',
        'fk_user',
        'fk_adherent',
        'restricted_ips',
        'datec',
        'tms',
        'entity'
    ];
}
