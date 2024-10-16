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

namespace Dolibarr\Code\Societe\Model;

use Dolibarr\Code\User\Model\User;
use Dolibarr\Core\Base\Model;
use Dolibarr\Core\Model\CTypeContact;

/**
 * Class SocieteCommerciaux
 *
 * @property int $rowid
 * @property int|null $fk_soc
 * @property int|null $fk_user
 * @property string $fk_c_type_contact_code
 * @property string|null $import_key
 *
 * @property CTypeContact $c_type_contact
 * @property Societe|null $societe
 * @property User|null $user
 */
class SocieteCommerciaux extends Model
{
    public $timestamps = false;
    protected $table = 'societe_commerciaux';
    protected $casts = [
        'fk_soc' => 'int',
        'fk_user' => 'int'
    ];

    protected $fillable = [
        'fk_soc',
        'fk_user',
        'fk_c_type_contact_code',
        'import_key'
    ];

    public function c_type_contact()
    {
        return $this->belongsTo(CTypeContact::class, 'fk_c_type_contact_code', 'code');
    }

    public function societe()
    {
        return $this->belongsTo(Societe::class, 'fk_soc');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'fk_user');
    }
}
