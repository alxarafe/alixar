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

use App\Models\point;
use Carbon\Carbon;
use Dolibarr\Code\Adherents\Model\Adherent;
use Dolibarr\Code\Categories\Model\Categorie;
use Dolibarr\Code\Comm\Model\Propal;
use Dolibarr\Code\Commande\Model\Commande;
use Dolibarr\Code\Compta\Model\Facture;
use Dolibarr\Code\Compta\Model\FactureRec;
use Dolibarr\Code\Contact\Model\Socperson;
use Dolibarr\Code\Contrat\Model\Contrat;
use Dolibarr\Code\Delivery\Model\Delivery;
use Dolibarr\Code\Expedition\Model\Expedition;
use Dolibarr\Code\FactureFournisseur\Model\FactureFourn;
use Dolibarr\Code\FactureFournisseur\Model\FactureFournRec;
use Dolibarr\Code\FichInter\Model\Fichinter;
use Dolibarr\Code\Fourn\Model\CategorieFournisseur;
use Dolibarr\Code\Fourn\Model\CommandeFournisseur;
use Dolibarr\Code\Product\Model\ProductCustomerPrice;
use Dolibarr\Code\Projet\Model\Projet;
use Dolibarr\Code\Reception\Model\Reception;
use Dolibarr\Core\Base\Model;
use Illuminate\Database\Eloquent\Collection;

/**
 * Class Societe
 *
 * @property int $rowid
 * @property string|null $nom
 * @property string|null $name_alias
 * @property int $entity
 * @property string|null $ref_ext
 * @property int|null $statut
 * @property int|null $parent
 * @property int|null $status
 * @property string|null $code_client
 * @property string|null $code_fournisseur
 * @property string|null $code_compta
 * @property string|null $code_compta_fournisseur
 * @property string|null $address
 * @property string|null $zip
 * @property string|null $town
 * @property int|null $fk_departement
 * @property int|null $fk_pays
 * @property float|null $geolat
 * @property float|null $geolong
 * @property point|null $geopoint
 * @property string|null $georesultcode
 * @property string|null $phone
 * @property string|null $phone_mobile
 * @property string|null $fax
 * @property string|null $url
 * @property string|null $email
 * @property int|null $fk_account
 * @property string|null $socialnetworks
 * @property int|null $fk_effectif
 * @property int|null $fk_typent
 * @property int|null $fk_forme_juridique
 * @property string|null $fk_currency
 * @property string|null $siren
 * @property string|null $siret
 * @property string|null $ape
 * @property string|null $idprof4
 * @property string|null $idprof5
 * @property string|null $idprof6
 * @property string|null $tva_intra
 * @property float|null $capital
 * @property int $fk_stcomm
 * @property string|null $note_private
 * @property string|null $note_public
 * @property string|null $model_pdf
 * @property string|null $last_main_doc
 * @property string|null $prefix_comm
 * @property int|null $client
 * @property int|null $fournisseur
 * @property string|null $supplier_account
 * @property string|null $fk_prospectlevel
 * @property int|null $fk_incoterms
 * @property string|null $location_incoterms
 * @property int|null $customer_bad
 * @property float|null $customer_rate
 * @property float|null $supplier_rate
 * @property float|null $remise_client
 * @property float|null $remise_supplier
 * @property int|null $mode_reglement
 * @property int|null $cond_reglement
 * @property string|null $deposit_percent
 * @property int|null $transport_mode
 * @property int|null $mode_reglement_supplier
 * @property int|null $cond_reglement_supplier
 * @property int|null $transport_mode_supplier
 * @property int|null $fk_shipping_method
 * @property int|null $tva_assuj
 * @property int|null $vat_reverse_charge
 * @property int|null $localtax1_assuj
 * @property float|null $localtax1_value
 * @property int|null $localtax2_assuj
 * @property float|null $localtax2_value
 * @property string|null $barcode
 * @property int|null $fk_barcode_type
 * @property int|null $price_level
 * @property float|null $outstanding_limit
 * @property float|null $order_min_amount
 * @property float|null $supplier_order_min_amount
 * @property string|null $default_lang
 * @property string|null $logo
 * @property string|null $logo_squarred
 * @property string|null $canvas
 * @property int|null $fk_warehouse
 * @property string|null $webservices_url
 * @property string|null $webservices_key
 * @property string|null $accountancy_code_sell
 * @property string|null $accountancy_code_buy
 * @property Carbon|null $tms
 * @property Carbon|null $datec
 * @property int|null $fk_user_creat
 * @property int|null $fk_user_modif
 * @property int|null $fk_multicurrency
 * @property string|null $multicurrency_code
 * @property string|null $import_key
 *
 * @property Adherent $adherent
 * @property Collection|CategorieFournisseur[] $categorie_fournisseurs
 * @property Collection|Categorie[] $categories
 * @property Collection|Commande[] $commandes
 * @property Collection|CommandeFournisseur[] $commande_fournisseurs
 * @property Collection|Contrat[] $contrats
 * @property Collection|Delivery[] $deliveries
 * @property Collection|Expedition[] $expeditions
 * @property Collection|Facture[] $factures
 * @property Collection|FactureFourn[] $facture_fourns
 * @property Collection|FactureFournRec[] $facture_fourn_recs
 * @property Collection|FactureRec[] $facture_recs
 * @property Collection|Fichinter[] $fichinters
 * @property Collection|ProductCustomerPrice[] $product_customer_prices
 * @property Collection|Projet[] $projets
 * @property Collection|Propal[] $propals
 * @property Collection|Reception[] $receptions
 * @property Collection|SocieteAccount[] $societe_accounts
 * @property Collection|SocieteCommerciaux[] $societe_commerciauxes
 * @property Collection|SocieteContact[] $societe_contacts
 * @property Collection|SocieteRemiseExcept[] $societe_remise_excepts
 * @property Collection|SocieteRib[] $societe_ribs
 * @property Collection|Socperson[] $socpeople
 */
class Societe extends Model
{
    public $timestamps = false;
    protected $table = 'societe';
    protected $casts = [
        'entity' => 'int',
        'statut' => 'int',
        'parent' => 'int',
        'status' => 'int',
        'fk_departement' => 'int',
        'fk_pays' => 'int',
        'geolat' => 'float',
        'geolong' => 'float',
        'geopoint' => 'point',
        'fk_account' => 'int',
        'fk_effectif' => 'int',
        'fk_typent' => 'int',
        'fk_forme_juridique' => 'int',
        'capital' => 'float',
        'fk_stcomm' => 'int',
        'client' => 'int',
        'fournisseur' => 'int',
        'fk_incoterms' => 'int',
        'customer_bad' => 'int',
        'customer_rate' => 'float',
        'supplier_rate' => 'float',
        'remise_client' => 'float',
        'remise_supplier' => 'float',
        'mode_reglement' => 'int',
        'cond_reglement' => 'int',
        'transport_mode' => 'int',
        'mode_reglement_supplier' => 'int',
        'cond_reglement_supplier' => 'int',
        'transport_mode_supplier' => 'int',
        'fk_shipping_method' => 'int',
        'tva_assuj' => 'int',
        'vat_reverse_charge' => 'int',
        'localtax1_assuj' => 'int',
        'localtax1_value' => 'float',
        'localtax2_assuj' => 'int',
        'localtax2_value' => 'float',
        'fk_barcode_type' => 'int',
        'price_level' => 'int',
        'outstanding_limit' => 'float',
        'order_min_amount' => 'float',
        'supplier_order_min_amount' => 'float',
        'fk_warehouse' => 'int',
        'tms' => 'datetime',
        'datec' => 'datetime',
        'fk_user_creat' => 'int',
        'fk_user_modif' => 'int',
        'fk_multicurrency' => 'int'
    ];

    protected $fillable = [
        'nom',
        'name_alias',
        'entity',
        'ref_ext',
        'statut',
        'parent',
        'status',
        'code_client',
        'code_fournisseur',
        'code_compta',
        'code_compta_fournisseur',
        'address',
        'zip',
        'town',
        'fk_departement',
        'fk_pays',
        'geolat',
        'geolong',
        'geopoint',
        'georesultcode',
        'phone',
        'phone_mobile',
        'fax',
        'url',
        'email',
        'fk_account',
        'socialnetworks',
        'fk_effectif',
        'fk_typent',
        'fk_forme_juridique',
        'fk_currency',
        'siren',
        'siret',
        'ape',
        'idprof4',
        'idprof5',
        'idprof6',
        'tva_intra',
        'capital',
        'fk_stcomm',
        'note_private',
        'note_public',
        'model_pdf',
        'last_main_doc',
        'prefix_comm',
        'client',
        'fournisseur',
        'supplier_account',
        'fk_prospectlevel',
        'fk_incoterms',
        'location_incoterms',
        'customer_bad',
        'customer_rate',
        'supplier_rate',
        'remise_client',
        'remise_supplier',
        'mode_reglement',
        'cond_reglement',
        'deposit_percent',
        'transport_mode',
        'mode_reglement_supplier',
        'cond_reglement_supplier',
        'transport_mode_supplier',
        'fk_shipping_method',
        'tva_assuj',
        'vat_reverse_charge',
        'localtax1_assuj',
        'localtax1_value',
        'localtax2_assuj',
        'localtax2_value',
        'barcode',
        'fk_barcode_type',
        'price_level',
        'outstanding_limit',
        'order_min_amount',
        'supplier_order_min_amount',
        'default_lang',
        'logo',
        'logo_squarred',
        'canvas',
        'fk_warehouse',
        'webservices_url',
        'webservices_key',
        'accountancy_code_sell',
        'accountancy_code_buy',
        'tms',
        'datec',
        'fk_user_creat',
        'fk_user_modif',
        'fk_multicurrency',
        'multicurrency_code',
        'import_key'
    ];

    public function adherent()
    {
        return $this->hasOne(Adherent::class, 'fk_soc');
    }

    public function categorie_fournisseurs()
    {
        return $this->hasMany(CategorieFournisseur::class, 'fk_soc');
    }

    public function categories()
    {
        return $this->belongsToMany(Categorie::class, 'alx_categorie_societe', 'fk_soc', 'fk_categorie')
            ->withPivot('import_key');
    }

    public function commandes()
    {
        return $this->hasMany(Commande::class, 'fk_soc');
    }

    public function commande_fournisseurs()
    {
        return $this->hasMany(CommandeFournisseur::class, 'fk_soc');
    }

    public function contrats()
    {
        return $this->hasMany(Contrat::class, 'fk_soc');
    }

    public function deliveries()
    {
        return $this->hasMany(Delivery::class, 'fk_soc');
    }

    public function expeditions()
    {
        return $this->hasMany(Expedition::class, 'fk_soc');
    }

    public function factures()
    {
        return $this->hasMany(Facture::class, 'fk_soc');
    }

    public function facture_fourns()
    {
        return $this->hasMany(FactureFourn::class, 'fk_soc');
    }

    public function facture_fourn_recs()
    {
        return $this->hasMany(FactureFournRec::class, 'fk_soc');
    }

    public function facture_recs()
    {
        return $this->hasMany(FactureRec::class, 'fk_soc');
    }

    public function fichinters()
    {
        return $this->hasMany(Fichinter::class, 'fk_soc');
    }

    public function product_customer_prices()
    {
        return $this->hasMany(ProductCustomerPrice::class, 'fk_soc');
    }

    public function projets()
    {
        return $this->hasMany(Projet::class, 'fk_soc');
    }

    public function propals()
    {
        return $this->hasMany(Propal::class, 'fk_soc');
    }

    public function receptions()
    {
        return $this->hasMany(Reception::class, 'fk_soc');
    }

    public function societe_accounts()
    {
        return $this->hasMany(SocieteAccount::class, 'fk_soc');
    }

    public function societe_commerciauxes()
    {
        return $this->hasMany(SocieteCommerciaux::class, 'fk_soc');
    }

    public function societe_contacts()
    {
        return $this->hasMany(SocieteContact::class, 'fk_soc');
    }

    public function societe_remise_excepts()
    {
        return $this->hasMany(SocieteRemiseExcept::class, 'fk_soc');
    }

    public function societe_ribs()
    {
        return $this->hasMany(SocieteRib::class, 'fk_soc');
    }

    public function socpeople()
    {
        return $this->hasMany(Socperson::class, 'fk_soc');
    }
}
