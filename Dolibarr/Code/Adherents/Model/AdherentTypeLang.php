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

namespace Dolibarr\Code\Adherents\Model;

use Dolibarr\Core\Base\Model;

/**
 * Class AdherentTypeLang
 *
 * @property int $rowid
 * @property int $fk_type
 * @property string $lang
 * @property string $label
 * @property string|null $description
 * @property string|null $email
 * @property string|null $import_key
 */
class AdherentTypeLang extends Model
{
    public $timestamps = false;
    protected $table = 'adherent_type_lang';
    protected $casts = [
        'fk_type' => 'int'
    ];

    protected $fillable = [
        'fk_type',
        'lang',
        'label',
        'description',
        'email',
        'import_key'
    ];
}
