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

namespace Dolibarr\Code\FichInter\Model;

use Carbon\Carbon;
use Dolibarr\Code\Societe\Model\Societe;
use Dolibarr\Core\Base\Model;
use Illuminate\Database\Eloquent\Collection;

/**
 * Class Fichinter
 *
 * @property int $rowid
 * @property int $fk_soc
 * @property int|null $fk_projet
 * @property int|null $fk_contrat
 * @property string $ref
 * @property string|null $ref_ext
 * @property string|null $ref_client
 * @property int $entity
 * @property Carbon|null $tms
 * @property Carbon|null $datec
 * @property Carbon|null $date_valid
 * @property Carbon|null $datei
 * @property int|null $fk_user_author
 * @property int|null $fk_user_modif
 * @property int|null $fk_user_valid
 * @property int|null $fk_statut
 * @property Carbon|null $dateo
 * @property Carbon|null $datee
 * @property Carbon|null $datet
 * @property float|null $duree
 * @property string|null $description
 * @property int|null $signed_status
 * @property string|null $online_sign_ip
 * @property string|null $online_sign_name
 * @property string|null $note_private
 * @property string|null $note_public
 * @property string|null $model_pdf
 * @property string|null $last_main_doc
 * @property string|null $import_key
 * @property string|null $extraparams
 *
 * @property Societe $societe
 * @property Collection|Fichinterdet[] $fichinterdets
 */
class Fichinter extends Model
{
    public $timestamps = false;
    protected $table = 'fichinter';
    protected $casts = [
        'fk_soc' => 'int',
        'fk_projet' => 'int',
        'fk_contrat' => 'int',
        'entity' => 'int',
        'tms' => 'datetime',
        'datec' => 'datetime',
        'date_valid' => 'datetime',
        'datei' => 'datetime',
        'fk_user_author' => 'int',
        'fk_user_modif' => 'int',
        'fk_user_valid' => 'int',
        'fk_statut' => 'int',
        'dateo' => 'datetime',
        'datee' => 'datetime',
        'datet' => 'datetime',
        'duree' => 'float',
        'signed_status' => 'int'
    ];

    protected $fillable = [
        'fk_soc',
        'fk_projet',
        'fk_contrat',
        'ref',
        'ref_ext',
        'ref_client',
        'entity',
        'tms',
        'datec',
        'date_valid',
        'datei',
        'fk_user_author',
        'fk_user_modif',
        'fk_user_valid',
        'fk_statut',
        'dateo',
        'datee',
        'datet',
        'duree',
        'description',
        'signed_status',
        'online_sign_ip',
        'online_sign_name',
        'note_private',
        'note_public',
        'model_pdf',
        'last_main_doc',
        'import_key',
        'extraparams'
    ];

    public function societe()
    {
        return $this->belongsTo(Societe::class, 'fk_soc');
    }

    public function fichinterdets()
    {
        return $this->hasMany(Fichinterdet::class, 'fk_fichinter');
    }
}
