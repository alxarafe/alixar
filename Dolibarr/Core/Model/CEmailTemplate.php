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
 * Class CEmailTemplate
 *
 * @property int $rowid
 * @property int $entity
 * @property string|null $module
 * @property string|null $type_template
 * @property string|null $lang
 * @property int $private
 * @property int|null $fk_user
 * @property Carbon|null $datec
 * @property Carbon|null $tms
 * @property string|null $label
 * @property int|null $position
 * @property int|null $defaultfortype
 * @property string|null $enabled
 * @property int $active
 * @property string|null $email_from
 * @property string|null $email_to
 * @property string|null $email_tocc
 * @property string|null $email_tobcc
 * @property string|null $topic
 * @property string|null $joinfiles
 * @property string|null $content
 * @property string|null $content_lines
 */
class CEmailTemplate extends Model
{
    public $timestamps = false;
    protected $table = 'c_email_templates';
    protected $casts = [
        'entity' => 'int',
        'private' => 'int',
        'fk_user' => 'int',
        'datec' => 'datetime',
        'tms' => 'datetime',
        'position' => 'int',
        'defaultfortype' => 'int',
        'active' => 'int'
    ];

    protected $fillable = [
        'entity',
        'module',
        'type_template',
        'lang',
        'private',
        'fk_user',
        'datec',
        'tms',
        'label',
        'position',
        'defaultfortype',
        'enabled',
        'active',
        'email_from',
        'email_to',
        'email_tocc',
        'email_tobcc',
        'topic',
        'joinfiles',
        'content',
        'content_lines'
    ];
}
