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

namespace Dolibarr\Code\Projet\Model;

use Carbon\Carbon;
use Dolibarr\Code\Comm\Model\Propal;
use Dolibarr\Code\Commande\Model\Commande;
use Dolibarr\Code\Compta\Model\Facture;
use Dolibarr\Code\Compta\Model\FactureRec;
use Dolibarr\Code\FactureFournisseur\Model\FactureFourn;
use Dolibarr\Code\FactureFournisseur\Model\FactureFournRec;
use Dolibarr\Code\FichInter\Model\FichinterRec;
use Dolibarr\Code\Societe\Model\Societe;
use Dolibarr\Core\Base\Model;
use Illuminate\Database\Eloquent\Collection;

/**
 * Class Projet
 *
 * @property int $rowid
 * @property int|null $fk_project
 * @property int|null $fk_soc
 * @property Carbon|null $datec
 * @property Carbon|null $tms
 * @property Carbon|null $dateo
 * @property Carbon|null $datee
 * @property string|null $ref
 * @property string|null $ref_ext
 * @property int $entity
 * @property string $title
 * @property string|null $description
 * @property int $fk_user_creat
 * @property int|null $fk_user_modif
 * @property int|null $public
 * @property int $fk_statut
 * @property int|null $fk_opp_status
 * @property float|null $opp_percent
 * @property int|null $fk_opp_status_end
 * @property Carbon|null $date_close
 * @property int|null $fk_user_close
 * @property string|null $note_private
 * @property string|null $note_public
 * @property string|null $email_msgid
 * @property Carbon|null $email_date
 * @property float|null $opp_amount
 * @property float|null $budget_amount
 * @property int|null $usage_opportunity
 * @property int|null $usage_task
 * @property int|null $usage_bill_time
 * @property int|null $usage_organize_event
 * @property Carbon|null $date_start_event
 * @property Carbon|null $date_end_event
 * @property string|null $location
 * @property int|null $accept_conference_suggestions
 * @property int|null $accept_booth_suggestions
 * @property int|null $max_attendees
 * @property float|null $price_registration
 * @property float|null $price_booth
 * @property string|null $model_pdf
 * @property string|null $ip
 * @property string|null $last_main_doc
 * @property string|null $import_key
 * @property string|null $extraparams
 *
 * @property Societe|null $societe
 * @property Collection|CategorieProject[] $categorie_projects
 * @property Collection|Commande[] $commandes
 * @property Collection|Facture[] $factures
 * @property Collection|FactureFourn[] $facture_fourns
 * @property Collection|FactureFournRec[] $facture_fourn_recs
 * @property Collection|FactureRec[] $facture_recs
 * @property Collection|FichinterRec[] $fichinter_recs
 * @property Collection|ProjetTask[] $projet_tasks
 * @property Collection|Propal[] $propals
 */
class Projet extends Model
{
    public $timestamps = false;
    protected $table = 'projet';
    protected $casts = [
        'fk_project' => 'int',
        'fk_soc' => 'int',
        'datec' => 'datetime',
        'tms' => 'datetime',
        'dateo' => 'datetime',
        'datee' => 'datetime',
        'entity' => 'int',
        'fk_user_creat' => 'int',
        'fk_user_modif' => 'int',
        'public' => 'int',
        'fk_statut' => 'int',
        'fk_opp_status' => 'int',
        'opp_percent' => 'float',
        'fk_opp_status_end' => 'int',
        'date_close' => 'datetime',
        'fk_user_close' => 'int',
        'email_date' => 'datetime',
        'opp_amount' => 'float',
        'budget_amount' => 'float',
        'usage_opportunity' => 'int',
        'usage_task' => 'int',
        'usage_bill_time' => 'int',
        'usage_organize_event' => 'int',
        'date_start_event' => 'datetime',
        'date_end_event' => 'datetime',
        'accept_conference_suggestions' => 'int',
        'accept_booth_suggestions' => 'int',
        'max_attendees' => 'int',
        'price_registration' => 'float',
        'price_booth' => 'float'
    ];

    protected $fillable = [
        'fk_project',
        'fk_soc',
        'datec',
        'tms',
        'dateo',
        'datee',
        'ref',
        'ref_ext',
        'entity',
        'title',
        'description',
        'fk_user_creat',
        'fk_user_modif',
        'public',
        'fk_statut',
        'fk_opp_status',
        'opp_percent',
        'fk_opp_status_end',
        'date_close',
        'fk_user_close',
        'note_private',
        'note_public',
        'email_msgid',
        'email_date',
        'opp_amount',
        'budget_amount',
        'usage_opportunity',
        'usage_task',
        'usage_bill_time',
        'usage_organize_event',
        'date_start_event',
        'date_end_event',
        'location',
        'accept_conference_suggestions',
        'accept_booth_suggestions',
        'max_attendees',
        'price_registration',
        'price_booth',
        'model_pdf',
        'ip',
        'last_main_doc',
        'import_key',
        'extraparams'
    ];

    public function societe()
    {
        return $this->belongsTo(Societe::class, 'fk_soc');
    }

    public function categorie_projects()
    {
        return $this->hasMany(CategorieProject::class, 'fk_project');
    }

    public function commandes()
    {
        return $this->hasMany(Commande::class, 'fk_projet');
    }

    public function factures()
    {
        return $this->hasMany(Facture::class, 'fk_projet');
    }

    public function facture_fourns()
    {
        return $this->hasMany(FactureFourn::class, 'fk_projet');
    }

    public function facture_fourn_recs()
    {
        return $this->hasMany(FactureFournRec::class, 'fk_projet');
    }

    public function facture_recs()
    {
        return $this->hasMany(FactureRec::class, 'fk_projet');
    }

    public function fichinter_recs()
    {
        return $this->hasMany(FichinterRec::class, 'fk_projet');
    }

    public function projet_tasks()
    {
        return $this->hasMany(ProjetTask::class, 'fk_projet');
    }

    public function propals()
    {
        return $this->hasMany(Propal::class, 'fk_projet');
    }
}
