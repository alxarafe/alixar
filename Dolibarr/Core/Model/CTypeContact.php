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

use Dolibarr\Code\Societe\Model\SocieteCommerciaux;
use Dolibarr\Code\Societe\Model\SocieteContact;
use Dolibarr\Core\Base\Model;
use Illuminate\Database\Eloquent\Collection;

/**
 * Class CTypeContact
 *
 * @property int $rowid
 * @property string $element
 * @property string $source
 * @property string $code
 * @property string $libelle
 * @property int $active
 * @property string|null $module
 * @property int $position
 *
 * @property Collection|ElementContact[] $element_contacts
 * @property Collection|SocieteCommerciaux[] $societe_commerciauxes
 * @property Collection|SocieteContact[] $societe_contacts
 */
class CTypeContact extends Model
{
    public $timestamps = false;
    protected $table = 'c_type_contact';
    protected $casts = [
        'active' => 'int',
        'position' => 'int'
    ];

    protected $fillable = [
        'element',
        'source',
        'code',
        'libelle',
        'active',
        'module',
        'position'
    ];

    public function element_contacts()
    {
        return $this->hasMany(ElementContact::class, 'fk_c_type_contact');
    }

    public function societe_commerciauxes()
    {
        return $this->hasMany(SocieteCommerciaux::class, 'fk_c_type_contact_code', 'code');
    }

    public function societe_contacts()
    {
        return $this->hasMany(SocieteContact::class, 'fk_c_type_contact');
    }
}
