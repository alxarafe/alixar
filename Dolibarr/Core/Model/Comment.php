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
 * Class Comment
 *
 * @property int $rowid
 * @property Carbon|null $datec
 * @property Carbon|null $tms
 * @property string $description
 * @property int|null $fk_user_author
 * @property int|null $fk_user_modif
 * @property int|null $fk_element
 * @property string|null $element_type
 * @property int|null $entity
 * @property string|null $import_key
 */
class Comment extends Model
{
    public $timestamps = false;
    protected $table = 'comment';
    protected $casts = [
        'datec' => 'datetime',
        'tms' => 'datetime',
        'fk_user_author' => 'int',
        'fk_user_modif' => 'int',
        'fk_element' => 'int',
        'entity' => 'int'
    ];

    protected $fillable = [
        'datec',
        'tms',
        'description',
        'fk_user_author',
        'fk_user_modif',
        'fk_element',
        'element_type',
        'entity',
        'import_key'
    ];
}
