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
use Dolibarr\Code\User\Model\User;
use Dolibarr\Core\Base\Model;

/**
 * Class BookcalAvailability
 *
 * @property int $rowid
 * @property string|null $label
 * @property string|null $description
 * @property string|null $note_public
 * @property string|null $note_private
 * @property Carbon $date_creation
 * @property Carbon|null $tms
 * @property int $fk_user_creat
 * @property int|null $fk_user_modif
 * @property string|null $last_main_doc
 * @property string|null $import_key
 * @property string|null $model_pdf
 * @property int $status
 * @property Carbon $start
 * @property Carbon $end
 * @property int $duration
 * @property int $startHour
 * @property int $endHour
 * @property int $fk_bookcal_calendar
 *
 * @property BookcalCalendar $bookcal_calendar
 * @property User $user
 */
class BookcalAvailability extends Model
{
    public $timestamps = false;
    protected $table = 'bookcal_availabilities';
    protected $casts = [
        'date_creation' => 'datetime',
        'tms' => 'datetime',
        'fk_user_creat' => 'int',
        'fk_user_modif' => 'int',
        'status' => 'int',
        'start' => 'datetime',
        'end' => 'datetime',
        'duration' => 'int',
        'startHour' => 'int',
        'endHour' => 'int',
        'fk_bookcal_calendar' => 'int'
    ];

    protected $fillable = [
        'label',
        'description',
        'note_public',
        'note_private',
        'date_creation',
        'tms',
        'fk_user_creat',
        'fk_user_modif',
        'last_main_doc',
        'import_key',
        'model_pdf',
        'status',
        'start',
        'end',
        'duration',
        'startHour',
        'endHour',
        'fk_bookcal_calendar'
    ];

    public function bookcal_calendar()
    {
        return $this->belongsTo(BookcalCalendar::class, 'fk_bookcal_calendar');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'fk_user_creat');
    }
}
