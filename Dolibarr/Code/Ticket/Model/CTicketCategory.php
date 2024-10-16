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

namespace Dolibarr\Code\Ticket\Model;

use Dolibarr\Core\Base\Model;

/**
 * Class CTicketCategory
 *
 * @property int $rowid
 * @property int|null $entity
 * @property string $code
 * @property string $label
 * @property int|null $public
 * @property int|null $use_default
 * @property int $fk_parent
 * @property string|null $force_severity
 * @property string|null $description
 * @property int $pos
 * @property int|null $active
 */
class CTicketCategory extends Model
{
    public $timestamps = false;
    protected $table = 'c_ticket_category';
    protected $casts = [
        'entity' => 'int',
        'public' => 'int',
        'use_default' => 'int',
        'fk_parent' => 'int',
        'pos' => 'int',
        'active' => 'int'
    ];

    protected $fillable = [
        'entity',
        'code',
        'label',
        'public',
        'use_default',
        'fk_parent',
        'force_severity',
        'description',
        'pos',
        'active'
    ];
}
