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

namespace Dolibarr\Code\BookCal\Model;

use Carbon\Carbon;
use Dolibarr\Code\UserGroup\Model\User;
use Dolibarr\Core\Base\Model;
use Illuminate\Database\Eloquent\Collection;

/**
 * Class BookcalCalendar
 *
 * @property int $rowid
 * @property int $entity
 * @property string $ref
 * @property string|null $label
 * @property int|null $fk_soc
 * @property int|null $fk_project
 * @property string|null $description
 * @property string|null $note_public
 * @property string|null $note_private
 * @property Carbon $date_creation
 * @property Carbon|null $tms
 * @property int $fk_user_creat
 * @property int|null $fk_user_modif
 * @property string|null $import_key
 * @property int $status
 * @property int $type
 * @property int $visibility
 *
 * @property User $user
 * @property Collection|BookcalAvailability[] $bookcal_availabilities
 */
class BookcalCalendar extends Model
{
    public $timestamps = false;
    protected $table = 'bookcal_calendar';
    protected $casts = [
        'entity' => 'int',
        'fk_soc' => 'int',
        'fk_project' => 'int',
        'date_creation' => 'datetime',
        'tms' => 'datetime',
        'fk_user_creat' => 'int',
        'fk_user_modif' => 'int',
        'status' => 'int',
        'type' => 'int',
        'visibility' => 'int'
    ];

    protected $fillable = [
        'entity',
        'ref',
        'label',
        'fk_soc',
        'fk_project',
        'description',
        'note_public',
        'note_private',
        'date_creation',
        'tms',
        'fk_user_creat',
        'fk_user_modif',
        'import_key',
        'status',
        'type',
        'visibility'
    ];

    public function user()
    {
        return $this->belongsTo(User::class, 'fk_user_creat');
    }

    public function bookcal_availabilities()
    {
        return $this->hasMany(BookcalAvailability::class, 'fk_bookcal_calendar');
    }
}
