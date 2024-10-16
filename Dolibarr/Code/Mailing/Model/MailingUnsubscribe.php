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
 * Class MailingUnsubscribe
 *
 * @property int $rowid
 * @property int $entity
 * @property string|null $email
 * @property string|null $unsubscribegroup
 * @property string|null $ip
 * @property Carbon|null $date_creat
 * @property Carbon|null $tms
 */
class MailingUnsubscribe extends Model
{
    public $timestamps = false;
    protected $table = 'mailing_unsubscribe';
    protected $casts = [
        'entity' => 'int',
        'date_creat' => 'datetime',
        'tms' => 'datetime'
    ];

    protected $fillable = [
        'entity',
        'email',
        'unsubscribegroup',
        'ip',
        'date_creat',
        'tms'
    ];
}
