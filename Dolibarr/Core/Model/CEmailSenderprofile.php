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
 * Class CEmailSenderprofile
 *
 * @property int $rowid
 * @property int $entity
 * @property int $private
 * @property Carbon|null $date_creation
 * @property Carbon|null $tms
 * @property string|null $label
 * @property string $email
 * @property string|null $signature
 * @property int|null $position
 * @property int $active
 */
class CEmailSenderprofile extends Model
{
    public $timestamps = false;
    protected $table = 'c_email_senderprofile';
    protected $casts = [
        'entity' => 'int',
        'private' => 'int',
        'date_creation' => 'datetime',
        'tms' => 'datetime',
        'position' => 'int',
        'active' => 'int'
    ];

    protected $fillable = [
        'entity',
        'private',
        'date_creation',
        'tms',
        'label',
        'email',
        'signature',
        'position',
        'active'
    ];
}
