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

namespace Dolibarr\Code\Ecm\Model;

use Carbon\Carbon;
use Dolibarr\Code\User\Model\User;
use Dolibarr\Core\Base\Model;

/**
 * Class EcmDirectory
 *
 * @property int $rowid
 * @property string $label
 * @property int $entity
 * @property int|null $fk_parent
 * @property string $description
 * @property int $cachenbofdoc
 * @property string|null $fullpath
 * @property string|null $extraparams
 * @property Carbon|null $date_c
 * @property Carbon|null $tms
 * @property int|null $fk_user_c
 * @property int|null $fk_user_m
 * @property string|null $note_private
 * @property string|null $note_public
 * @property string|null $acl
 *
 * @property User|null $user
 */
class EcmDirectory extends Model
{
    public $timestamps = false;
    protected $table = 'ecm_directories';
    protected $casts = [
        'entity' => 'int',
        'fk_parent' => 'int',
        'cachenbofdoc' => 'int',
        'date_c' => 'datetime',
        'tms' => 'datetime',
        'fk_user_c' => 'int',
        'fk_user_m' => 'int'
    ];

    protected $fillable = [
        'label',
        'entity',
        'fk_parent',
        'description',
        'cachenbofdoc',
        'fullpath',
        'extraparams',
        'date_c',
        'tms',
        'fk_user_c',
        'fk_user_m',
        'note_private',
        'note_public',
        'acl'
    ];

    public function user()
    {
        return $this->belongsTo(User::class, 'fk_user_m');
    }
}
