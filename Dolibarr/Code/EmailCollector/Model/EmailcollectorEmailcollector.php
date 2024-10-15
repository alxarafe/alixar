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

namespace Dolibarr\Code\EmailCollector\Model;

use Carbon\Carbon;
use Dolibarr\Core\Base\Model;
use Illuminate\Database\Eloquent\Collection;

/**
 * Class EmailcollectorEmailcollector
 *
 * @property int $rowid
 * @property int $entity
 * @property string $ref
 * @property string|null $label
 * @property string|null $description
 * @property string|null $host
 * @property string|null $port
 * @property string|null $hostcharset
 * @property string|null $imap_encryption
 * @property int|null $norsh
 * @property string|null $login
 * @property int|null $acces_type
 * @property string|null $oauth_service
 * @property string|null $password
 * @property string $source_directory
 * @property string|null $target_directory
 * @property int|null $maxemailpercollect
 * @property Carbon|null $datelastresult
 * @property string|null $codelastresult
 * @property string|null $lastresult
 * @property Carbon|null $datelastok
 * @property string|null $note_public
 * @property string|null $note_private
 * @property Carbon $date_creation
 * @property Carbon|null $tms
 * @property int $fk_user_creat
 * @property int|null $fk_user_modif
 * @property int $position
 * @property string|null $import_key
 * @property int $status
 *
 * @property Collection|EmailcollectorEmailcollectoraction[] $emailcollector_emailcollectoractions
 * @property Collection|EmailcollectorEmailcollectorfilter[] $emailcollector_emailcollectorfilters
 */
class EmailcollectorEmailcollector extends Model
{
    public $timestamps = false;
    protected $table = 'emailcollector_emailcollector';
    protected $casts = [
        'entity' => 'int',
        'norsh' => 'int',
        'acces_type' => 'int',
        'maxemailpercollect' => 'int',
        'datelastresult' => 'datetime',
        'datelastok' => 'datetime',
        'date_creation' => 'datetime',
        'tms' => 'datetime',
        'fk_user_creat' => 'int',
        'fk_user_modif' => 'int',
        'position' => 'int',
        'status' => 'int'
    ];

    protected $hidden = [
        'password'
    ];

    protected $fillable = [
        'entity',
        'ref',
        'label',
        'description',
        'host',
        'port',
        'hostcharset',
        'imap_encryption',
        'norsh',
        'login',
        'acces_type',
        'oauth_service',
        'password',
        'source_directory',
        'target_directory',
        'maxemailpercollect',
        'datelastresult',
        'codelastresult',
        'lastresult',
        'datelastok',
        'note_public',
        'note_private',
        'date_creation',
        'tms',
        'fk_user_creat',
        'fk_user_modif',
        'position',
        'import_key',
        'status'
    ];

    public function emailcollector_emailcollectoractions()
    {
        return $this->hasMany(EmailcollectorEmailcollectoraction::class, 'fk_emailcollector');
    }

    public function emailcollector_emailcollectorfilters()
    {
        return $this->hasMany(EmailcollectorEmailcollectorfilter::class, 'fk_emailcollector');
    }
}
