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

use Dolibarr\Core\Base\Model;

/**
 * Class OauthState
 *
 * @property int $rowid
 * @property string|null $service
 * @property string|null $state
 * @property int|null $fk_user
 * @property int|null $fk_adherent
 * @property int|null $entity
 */
class OauthState extends Model
{
    public $timestamps = false;
    protected $table = 'oauth_state';
    protected $casts = [
        'fk_user' => 'int',
        'fk_adherent' => 'int',
        'entity' => 'int'
    ];

    protected $fillable = [
        'service',
        'state',
        'fk_user',
        'fk_adherent',
        'entity'
    ];
}
