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

namespace Dolibarr\Code\Contact\Model;

use App\Models\point;
use Carbon\Carbon;
use Dolibarr\Code\Societe\Model\Societe;
use Dolibarr\Code\Societe\Model\SocieteContact;
use Dolibarr\Code\User\Model\User;
use Dolibarr\Core\Base\Model;
use Illuminate\Database\Eloquent\Collection;

/**
 * Class Socperson
 *
 * @property int $rowid
 * @property Carbon|null $datec
 * @property Carbon|null $tms
 * @property int|null $fk_soc
 * @property int $entity
 * @property string|null $ref_ext
 * @property string|null $name_alias
 * @property int|null $fk_parent
 * @property string|null $civility
 * @property string|null $lastname
 * @property string|null $firstname
 * @property string|null $address
 * @property string|null $zip
 * @property string|null $town
 * @property int|null $fk_departement
 * @property int|null $fk_pays
 * @property float|null $geolat
 * @property float|null $geolong
 * @property point|null $geopoint
 * @property string|null $georesultcode
 * @property Carbon|null $birthday
 * @property string|null $poste
 * @property string|null $phone
 * @property string|null $phone_perso
 * @property string|null $phone_mobile
 * @property string|null $fax
 * @property string|null $url
 * @property string|null $email
 * @property string|null $socialnetworks
 * @property string|null $photo
 * @property int $no_email
 * @property int $priv
 * @property string|null $fk_prospectlevel
 * @property int $fk_stcommcontact
 * @property int|null $fk_user_creat
 * @property int|null $fk_user_modif
 * @property string|null $note_private
 * @property string|null $note_public
 * @property string|null $default_lang
 * @property string|null $canvas
 * @property string|null $import_key
 * @property int $statut
 *
 * @property Societe|null $societe
 * @property User|null $user
 * @property Collection|CategorieContact[] $categorie_contacts
 * @property Collection|SocieteContact[] $societe_contacts
 */
class Socperson extends Model
{
    public $timestamps = false;
    protected $table = 'socpeople';
    protected $casts = [
        'datec' => 'datetime',
        'tms' => 'datetime',
        'fk_soc' => 'int',
        'entity' => 'int',
        'fk_parent' => 'int',
        'fk_departement' => 'int',
        'fk_pays' => 'int',
        'geolat' => 'float',
        'geolong' => 'float',
        'geopoint' => 'point',
        'birthday' => 'datetime',
        'no_email' => 'int',
        'priv' => 'int',
        'fk_stcommcontact' => 'int',
        'fk_user_creat' => 'int',
        'fk_user_modif' => 'int',
        'statut' => 'int'
    ];

    protected $fillable = [
        'datec',
        'tms',
        'fk_soc',
        'entity',
        'ref_ext',
        'name_alias',
        'fk_parent',
        'civility',
        'lastname',
        'firstname',
        'address',
        'zip',
        'town',
        'fk_departement',
        'fk_pays',
        'geolat',
        'geolong',
        'geopoint',
        'georesultcode',
        'birthday',
        'poste',
        'phone',
        'phone_perso',
        'phone_mobile',
        'fax',
        'url',
        'email',
        'socialnetworks',
        'photo',
        'no_email',
        'priv',
        'fk_prospectlevel',
        'fk_stcommcontact',
        'fk_user_creat',
        'fk_user_modif',
        'note_private',
        'note_public',
        'default_lang',
        'canvas',
        'import_key',
        'statut'
    ];

    public function societe()
    {
        return $this->belongsTo(Societe::class, 'fk_soc');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'fk_user_creat');
    }

    public function categorie_contacts()
    {
        return $this->hasMany(CategorieContact::class, 'fk_socpeople');
    }

    public function societe_contacts()
    {
        return $this->hasMany(SocieteContact::class, 'fk_socpeople');
    }
}
