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
 * Class ElementContact
 *
 * @property int $rowid
 * @property Carbon|null $datecreate
 * @property int|null $statut
 * @property int $element_id
 * @property int $fk_c_type_contact
 * @property int $fk_socpeople
 *
 * @property CTypeContact $c_type_contact
 */
class ElementContact extends Model
{
    public $timestamps = false;
    protected $table = 'element_contact';
    protected $casts = [
        'datecreate' => 'datetime',
        'statut' => 'int',
        'element_id' => 'int',
        'fk_c_type_contact' => 'int',
        'fk_socpeople' => 'int'
    ];

    protected $fillable = [
        'datecreate',
        'statut',
        'element_id',
        'fk_c_type_contact',
        'fk_socpeople'
    ];

    public function c_type_contact()
    {
        return $this->belongsTo(CTypeContact::class, 'fk_c_type_contact');
    }
}
