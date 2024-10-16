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
 * Class Menu
 *
 * @property int $rowid
 * @property string $menu_handler
 * @property int $entity
 * @property string|null $module
 * @property string $type
 * @property string $mainmenu
 * @property string|null $leftmenu
 * @property int $fk_menu
 * @property string|null $fk_mainmenu
 * @property string|null $fk_leftmenu
 * @property int $position
 * @property string $url
 * @property string|null $target
 * @property string $titre
 * @property string|null $prefix
 * @property string|null $langs
 * @property int|null $level
 * @property string|null $perms
 * @property string|null $enabled
 * @property int $usertype
 * @property Carbon|null $tms
 */
class Menu extends Model
{
    public $timestamps = false;
    protected $table = 'menu';
    protected $casts = [
        'entity' => 'int',
        'fk_menu' => 'int',
        'position' => 'int',
        'level' => 'int',
        'usertype' => 'int',
        'tms' => 'datetime'
    ];

    protected $fillable = [
        'menu_handler',
        'entity',
        'module',
        'type',
        'mainmenu',
        'leftmenu',
        'fk_menu',
        'fk_mainmenu',
        'fk_leftmenu',
        'position',
        'url',
        'target',
        'titre',
        'prefix',
        'langs',
        'level',
        'perms',
        'enabled',
        'usertype',
        'tms'
    ];
}
