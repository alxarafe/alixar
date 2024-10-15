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

use Dolibarr\Core\Base\Model;

/**
 * Class ActioncommResource
 *
 * @property int $rowid
 * @property int $fk_actioncomm
 * @property string $element_type
 * @property int $fk_element
 * @property string|null $answer_status
 * @property int|null $mandatory
 * @property int|null $transparency
 */
class ActioncommResource extends Model
{
    public $timestamps = false;
    protected $table = 'actioncomm_resources';
    protected $casts = [
        'fk_actioncomm' => 'int',
        'fk_element' => 'int',
        'mandatory' => 'int',
        'transparency' => 'int'
    ];

    protected $fillable = [
        'fk_actioncomm',
        'element_type',
        'fk_element',
        'answer_status',
        'mandatory',
        'transparency'
    ];
}
