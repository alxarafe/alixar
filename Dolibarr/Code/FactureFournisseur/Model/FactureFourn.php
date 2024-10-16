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

namespace Dolibarr\Code\FactureFournisseur\Model;

use Carbon\Carbon;
use Dolibarr\Code\Projet\Model\Projet;
use Dolibarr\Code\Societe\Model\Societe;
use Dolibarr\Code\Societe\Model\SocieteRemiseExcept;
use Dolibarr\Code\User\Model\User;
use Dolibarr\Core\Base\Model;
use Illuminate\Database\Eloquent\Collection;

/**
 * Class FactureFourn
 *
 * @property int $rowid
 * @property string $ref
 * @property string $ref_supplier
 * @property int $entity
 * @property string|null $ref_ext
 * @property int $type
 * @property int|null $subtype
 * @property int $fk_soc
 * @property Carbon|null $datec
 * @property Carbon|null $datef
 * @property Carbon|null $date_pointoftax
 * @property Carbon|null $date_valid
 * @property Carbon|null $tms
 * @property Carbon|null $date_closing
 * @property string|null $libelle
 * @property int $paye
 * @property float $amount
 * @property float|null $remise
 * @property string|null $close_code
 * @property float|null $close_missing_amount
 * @property string|null $close_note
 * @property int|null $vat_reverse_charge
 * @property float|null $tva
 * @property float|null $total_tva
 * @property float|null $localtax1
 * @property float|null $localtax2
 * @property float|null $revenuestamp
 * @property float|null $total_ht
 * @property float|null $total_ttc
 * @property int $fk_statut
 * @property int|null $fk_user_author
 * @property int|null $fk_user_modif
 * @property int|null $fk_user_valid
 * @property int|null $fk_user_closing
 * @property int|null $fk_fac_rec_source
 * @property int|null $fk_facture_source
 * @property int|null $fk_projet
 * @property int|null $fk_account
 * @property int|null $fk_cond_reglement
 * @property int|null $fk_mode_reglement
 * @property Carbon|null $date_lim_reglement
 * @property string|null $note_private
 * @property string|null $note_public
 * @property int|null $fk_incoterms
 * @property string|null $location_incoterms
 * @property int|null $fk_transport_mode
 * @property string|null $model_pdf
 * @property string|null $last_main_doc
 * @property string|null $import_key
 * @property string|null $extraparams
 * @property int|null $fk_multicurrency
 * @property string|null $multicurrency_code
 * @property float|null $multicurrency_tx
 * @property float|null $multicurrency_total_ht
 * @property float|null $multicurrency_total_tva
 * @property float|null $multicurrency_total_ttc
 *
 * @property Projet|null $projet
 * @property Societe $societe
 * @property User|null $user
 * @property Collection|FactureFournDet[] $facture_fourn_dets
 * @property Collection|SocieteRemiseExcept[] $societe_remise_excepts
 */
class FactureFourn extends Model
{
    public $timestamps = false;
    protected $table = 'facture_fourn';
    protected $casts = [
        'entity' => 'int',
        'type' => 'int',
        'subtype' => 'int',
        'fk_soc' => 'int',
        'datec' => 'datetime',
        'datef' => 'datetime',
        'date_pointoftax' => 'datetime',
        'date_valid' => 'datetime',
        'tms' => 'datetime',
        'date_closing' => 'datetime',
        'paye' => 'int',
        'amount' => 'float',
        'remise' => 'float',
        'close_missing_amount' => 'float',
        'vat_reverse_charge' => 'int',
        'tva' => 'float',
        'total_tva' => 'float',
        'localtax1' => 'float',
        'localtax2' => 'float',
        'revenuestamp' => 'float',
        'total_ht' => 'float',
        'total_ttc' => 'float',
        'fk_statut' => 'int',
        'fk_user_author' => 'int',
        'fk_user_modif' => 'int',
        'fk_user_valid' => 'int',
        'fk_user_closing' => 'int',
        'fk_fac_rec_source' => 'int',
        'fk_facture_source' => 'int',
        'fk_projet' => 'int',
        'fk_account' => 'int',
        'fk_cond_reglement' => 'int',
        'fk_mode_reglement' => 'int',
        'date_lim_reglement' => 'datetime',
        'fk_incoterms' => 'int',
        'fk_transport_mode' => 'int',
        'fk_multicurrency' => 'int',
        'multicurrency_tx' => 'float',
        'multicurrency_total_ht' => 'float',
        'multicurrency_total_tva' => 'float',
        'multicurrency_total_ttc' => 'float'
    ];

    protected $fillable = [
        'ref',
        'ref_supplier',
        'entity',
        'ref_ext',
        'type',
        'subtype',
        'fk_soc',
        'datec',
        'datef',
        'date_pointoftax',
        'date_valid',
        'tms',
        'date_closing',
        'libelle',
        'paye',
        'amount',
        'remise',
        'close_code',
        'close_missing_amount',
        'close_note',
        'vat_reverse_charge',
        'tva',
        'total_tva',
        'localtax1',
        'localtax2',
        'revenuestamp',
        'total_ht',
        'total_ttc',
        'fk_statut',
        'fk_user_author',
        'fk_user_modif',
        'fk_user_valid',
        'fk_user_closing',
        'fk_fac_rec_source',
        'fk_facture_source',
        'fk_projet',
        'fk_account',
        'fk_cond_reglement',
        'fk_mode_reglement',
        'date_lim_reglement',
        'note_private',
        'note_public',
        'fk_incoterms',
        'location_incoterms',
        'fk_transport_mode',
        'model_pdf',
        'last_main_doc',
        'import_key',
        'extraparams',
        'fk_multicurrency',
        'multicurrency_code',
        'multicurrency_tx',
        'multicurrency_total_ht',
        'multicurrency_total_tva',
        'multicurrency_total_ttc'
    ];

    public function projet()
    {
        return $this->belongsTo(Projet::class, 'fk_projet');
    }

    public function societe()
    {
        return $this->belongsTo(Societe::class, 'fk_soc');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'fk_user_valid');
    }

    public function facture_fourn_dets()
    {
        return $this->hasMany(FactureFournDet::class, 'fk_facture_fourn');
    }

    public function societe_remise_excepts()
    {
        return $this->hasMany(SocieteRemiseExcept::class, 'fk_invoice_supplier');
    }
}
