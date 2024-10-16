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
 * Class Extrafield
 *
 * @property int $rowid
 * @property string $name
 * @property int $entity
 * @property string $elementtype
 * @property string $label
 * @property string|null $type
 * @property string|null $size
 * @property string|null $fieldcomputed
 * @property string|null $fielddefault
 * @property int|null $fieldunique
 * @property int|null $fieldrequired
 * @property string|null $perms
 * @property string|null $enabled
 * @property int|null $pos
 * @property int|null $alwayseditable
 * @property string|null $param
 * @property string|null $list
 * @property int|null $printable
 * @property bool|null $totalizable
 * @property string|null $langs
 * @property string|null $help
 * @property string|null $css
 * @property string|null $cssview
 * @property string|null $csslist
 * @property int|null $fk_user_author
 * @property int|null $fk_user_modif
 * @property Carbon|null $datec
 * @property Carbon|null $tms
 */
class Extrafield extends Model
{
    public $timestamps = false;
    protected $table = 'extrafields';
    protected $casts = [
        'entity' => 'int',
        'fieldunique' => 'int',
        'fieldrequired' => 'int',
        'pos' => 'int',
        'alwayseditable' => 'int',
        'printable' => 'int',
        'totalizable' => 'bool',
        'fk_user_author' => 'int',
        'fk_user_modif' => 'int',
        'datec' => 'datetime',
        'tms' => 'datetime'
    ];

    protected $fillable = [
        'name',
        'entity',
        'elementtype',
        'label',
        'type',
        'size',
        'fieldcomputed',
        'fielddefault',
        'fieldunique',
        'fieldrequired',
        'perms',
        'enabled',
        'pos',
        'alwayseditable',
        'param',
        'list',
        'printable',
        'totalizable',
        'langs',
        'help',
        'css',
        'cssview',
        'csslist',
        'fk_user_author',
        'fk_user_modif',
        'datec',
        'tms'
    ];
}
