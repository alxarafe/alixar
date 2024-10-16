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

use Carbon\Carbon;
use Dolibarr\Code\Contact\Model\Socperson;
use Dolibarr\Core\Base\Model;
use Dolibarr\Core\Model\CTypeContact;

/**
 * Class SocieteContact
 *
 * @property int $rowid
 * @property int $entity
 * @property Carbon $date_creation
 * @property int $fk_soc
 * @property int $fk_c_type_contact
 * @property int $fk_socpeople
 * @property Carbon|null $tms
 * @property string|null $import_key
 *
 * @property CTypeContact $c_type_contact
 * @property Societe $societe
 * @property Socperson $socperson
 */
class SocieteContact extends Model
{
    public $timestamps = false;
    protected $table = 'societe_contacts';
    protected $casts = [
        'entity' => 'int',
        'date_creation' => 'datetime',
        'fk_soc' => 'int',
        'fk_c_type_contact' => 'int',
        'fk_socpeople' => 'int',
        'tms' => 'datetime'
    ];

    protected $fillable = [
        'entity',
        'date_creation',
        'fk_soc',
        'fk_c_type_contact',
        'fk_socpeople',
        'tms',
        'import_key'
    ];

    public function c_type_contact()
    {
        return $this->belongsTo(CTypeContact::class, 'fk_c_type_contact');
    }

    public function societe()
    {
        return $this->belongsTo(Societe::class, 'fk_soc');
    }

    public function socperson()
    {
        return $this->belongsTo(Socperson::class, 'fk_socpeople');
    }
}
