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

namespace Dolibarr\Code\Comm\Model;

use Carbon\Carbon;
use Dolibarr\Core\Base\Model;

/**
 * Class MailingAdvtarget
 *
 * @property int $rowid
 * @property string $name
 * @property int $entity
 * @property int $fk_element
 * @property string $type_element
 * @property string|null $filtervalue
 * @property int $fk_user_author
 * @property Carbon $datec
 * @property int $fk_user_mod
 * @property Carbon $tms
 */
class MailingAdvtarget extends Model
{
    public $timestamps = false;
    protected $table = 'mailing_advtarget';
    protected $casts = [
        'entity' => 'int',
        'fk_element' => 'int',
        'fk_user_author' => 'int',
        'datec' => 'datetime',
        'fk_user_mod' => 'int',
        'tms' => 'datetime'
    ];

    protected $fillable = [
        'name',
        'entity',
        'fk_element',
        'type_element',
        'filtervalue',
        'fk_user_author',
        'datec',
        'fk_user_mod',
        'tms'
    ];
}
