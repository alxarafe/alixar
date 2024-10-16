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
use Dolibarr\Core\Base\Model;

/**
 * Class SocieteAccount
 *
 * @property int $rowid
 * @property int|null $entity
 * @property string $login
 * @property string|null $pass_encoding
 * @property string|null $pass_crypted
 * @property string|null $pass_temp
 * @property int|null $fk_soc
 * @property int|null $fk_website
 * @property string $site
 * @property string|null $site_account
 * @property string|null $key_account
 * @property string|null $note_private
 * @property Carbon|null $date_last_login
 * @property Carbon|null $date_previous_login
 * @property Carbon $date_creation
 * @property Carbon|null $tms
 * @property int $fk_user_creat
 * @property int|null $fk_user_modif
 * @property string|null $import_key
 * @property int|null $status
 *
 * @property Societe|null $societe
 */
class SocieteAccount extends Model
{
    public $timestamps = false;
    protected $table = 'societe_account';
    protected $casts = [
        'entity' => 'int',
        'fk_soc' => 'int',
        'fk_website' => 'int',
        'date_last_login' => 'datetime',
        'date_previous_login' => 'datetime',
        'date_creation' => 'datetime',
        'tms' => 'datetime',
        'fk_user_creat' => 'int',
        'fk_user_modif' => 'int',
        'status' => 'int'
    ];

    protected $fillable = [
        'entity',
        'login',
        'pass_encoding',
        'pass_crypted',
        'pass_temp',
        'fk_soc',
        'fk_website',
        'site',
        'site_account',
        'key_account',
        'note_private',
        'date_last_login',
        'date_previous_login',
        'date_creation',
        'tms',
        'fk_user_creat',
        'fk_user_modif',
        'import_key',
        'status'
    ];

    public function societe()
    {
        return $this->belongsTo(Societe::class, 'fk_soc');
    }
}
