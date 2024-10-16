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

use Carbon\Carbon;
use Dolibarr\Core\Base\Model;
use Illuminate\Database\Eloquent\Collection;

/**
 * Class Usergroup
 *
 * @property int $rowid
 * @property string $nom
 * @property int $entity
 * @property Carbon|null $datec
 * @property Carbon|null $tms
 * @property string|null $note
 * @property string|null $model_pdf
 *
 * @property Collection|UsergroupRight[] $usergroup_rights
 * @property Collection|User[] $users
 */
class Usergroup extends Model
{
    public $timestamps = false;
    protected $table = 'usergroup';
    protected $casts = [
        'entity' => 'int',
        'datec' => 'datetime',
        'tms' => 'datetime'
    ];

    protected $fillable = [
        'nom',
        'entity',
        'datec',
        'tms',
        'note',
        'model_pdf'
    ];

    public function usergroup_rights()
    {
        return $this->hasMany(UsergroupRight::class, 'fk_usergroup');
    }

    public function users()
    {
        return $this->belongsToMany(User::class, 'alx_usergroup_user', 'fk_usergroup', 'fk_user')
            ->withPivot('rowid', 'entity');
    }
}
