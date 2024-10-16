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

namespace Dolibarr\Code\User\Model;

use Dolibarr\Core\Base\Model;

/**
 * Class UsergroupRight
 *
 * @property int $rowid
 * @property int $entity
 * @property int $fk_usergroup
 * @property int $fk_id
 *
 * @property Usergroup $usergroup
 */
class UsergroupRight extends Model
{
    public $timestamps = false;
    protected $table = 'usergroup_rights';
    protected $casts = [
        'entity' => 'int',
        'fk_usergroup' => 'int',
        'fk_id' => 'int'
    ];

    protected $fillable = [
        'entity',
        'fk_usergroup',
        'fk_id'
    ];

    public function usergroup()
    {
        return $this->belongsTo(Usergroup::class, 'fk_usergroup');
    }
}
