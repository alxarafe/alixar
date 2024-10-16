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

namespace Dolibarr\Code\Contrat\Model;

use Carbon\Carbon;
use Dolibarr\Code\Societe\Model\Societe;
use Dolibarr\Code\User\Model\User;
use Dolibarr\Core\Base\Model;
use Illuminate\Database\Eloquent\Collection;

/**
 * Class Contrat
 *
 * @property int $rowid
 * @property string|null $ref
 * @property string|null $ref_customer
 * @property string|null $ref_supplier
 * @property string|null $ref_ext
 * @property int $entity
 * @property Carbon|null $tms
 * @property Carbon|null $datec
 * @property Carbon|null $date_contrat
 * @property int|null $statut
 * @property Carbon|null $fin_validite
 * @property Carbon|null $date_cloture
 * @property int $fk_soc
 * @property int|null $fk_projet
 * @property int|null $fk_commercial_signature
 * @property int|null $fk_commercial_suivi
 * @property int $fk_user_author
 * @property int|null $fk_user_modif
 * @property int|null $fk_user_cloture
 * @property float|null $total_tva
 * @property float|null $localtax1
 * @property float|null $localtax2
 * @property float|null $revenuestamp
 * @property float|null $total_ht
 * @property float|null $total_ttc
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
 * @property User $user
 * @property Collection|Contratdet[] $contratdets
 */
class Contrat extends Model
{
    public $timestamps = false;
    protected $table = 'contrat';
    protected $casts = [
        'entity' => 'int',
        'tms' => 'datetime',
        'datec' => 'datetime',
        'date_contrat' => 'datetime',
        'statut' => 'int',
        'fin_validite' => 'datetime',
        'date_cloture' => 'datetime',
        'fk_soc' => 'int',
        'fk_projet' => 'int',
        'fk_commercial_signature' => 'int',
        'fk_commercial_suivi' => 'int',
        'fk_user_author' => 'int',
        'fk_user_modif' => 'int',
        'fk_user_cloture' => 'int',
        'total_tva' => 'float',
        'localtax1' => 'float',
        'localtax2' => 'float',
        'revenuestamp' => 'float',
        'total_ht' => 'float',
        'total_ttc' => 'float',
        'signed_status' => 'int'
    ];

    protected $fillable = [
        'ref',
        'ref_customer',
        'ref_supplier',
        'ref_ext',
        'entity',
        'tms',
        'datec',
        'date_contrat',
        'statut',
        'fin_validite',
        'date_cloture',
        'fk_soc',
        'fk_projet',
        'fk_commercial_signature',
        'fk_commercial_suivi',
        'fk_user_author',
        'fk_user_modif',
        'fk_user_cloture',
        'total_tva',
        'localtax1',
        'localtax2',
        'revenuestamp',
        'total_ht',
        'total_ttc',
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

    public function user()
    {
        return $this->belongsTo(User::class, 'fk_user_author');
    }

    public function contratdets()
    {
        return $this->hasMany(Contratdet::class, 'fk_contrat');
    }
}
