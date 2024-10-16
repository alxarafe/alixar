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

namespace Dolibarr\Code\User\Model;

use Carbon\Carbon;
use Dolibarr\Code\Bom\Model\BomBom;
use Dolibarr\Code\BookCal\Model\BookcalAvailability;
use Dolibarr\Code\BookCal\Model\BookcalCalendar;
use Dolibarr\Code\Categories\Model\Categorie;
use Dolibarr\Code\Comm\Model\Propal;
use Dolibarr\Code\Commande\Model\Commande;
use Dolibarr\Code\Compta\Model\Facture;
use Dolibarr\Code\Compta\Model\FactureRec;
use Dolibarr\Code\Contact\Model\Socperson;
use Dolibarr\Code\Contrat\Model\Contrat;
use Dolibarr\Code\Delivery\Model\Delivery;
use Dolibarr\Code\Ecm\Model\EcmDirectory;
use Dolibarr\Code\Expedition\Model\Expedition;
use Dolibarr\Code\FactureFournisseur\Model\FactureFourn;
use Dolibarr\Code\FactureFournisseur\Model\FactureFournRec;
use Dolibarr\Code\FichInter\Model\FichinterRec;
use Dolibarr\Code\Hrm\Model\HrmEvaluationdet;
use Dolibarr\Code\Hrm\Model\HrmSkill;
use Dolibarr\Code\Hrm\Model\HrmSkilldet;
use Dolibarr\Code\Hrm\Model\HrmSkillrank;
use Dolibarr\Code\KnowledgeManagement\Model\KnowledgemanagementKnowledgerecord;
use Dolibarr\Code\Mrp\Model\MrpMo;
use Dolibarr\Code\Product\Model\ProductCustomerPrice;
use Dolibarr\Code\Product\Model\ProductFournisseurPrice;
use Dolibarr\Code\Projet\Model\ProjetTask;
use Dolibarr\Code\Reception\Model\Reception;
use Dolibarr\Code\Recruitement\Model\RecruitmentRecruitmentcandidature;
use Dolibarr\Code\Recruitement\Model\RecruitmentRecruitmentjobposition;
use Dolibarr\Code\Salaries\Model\PaymentSalary;
use Dolibarr\Code\Societe\Model\SocieteCommerciaux;
use Dolibarr\Code\Societe\Model\SocieteRemiseExcept;
use Dolibarr\Code\StockTransfer\Model\StocktransferStocktransfer;
use Dolibarr\Code\WebHook\Model\WebhookTarget;
use Dolibarr\Code\Workstation\Model\WorkstationWorkstation;
use Dolibarr\Core\Base\Model;
use Illuminate\Database\Eloquent\Collection;

/**
 * Class User
 *
 * @property int $rowid
 * @property int $entity
 * @property string|null $ref_employee
 * @property string|null $ref_ext
 * @property int|null $admin
 * @property int|null $employee
 * @property int|null $fk_establishment
 * @property Carbon|null $datec
 * @property Carbon|null $tms
 * @property int|null $fk_user_creat
 * @property int|null $fk_user_modif
 * @property string $login
 * @property string|null $pass_encoding
 * @property string|null $pass
 * @property string|null $pass_crypted
 * @property string|null $pass_temp
 * @property string|null $api_key
 * @property string|null $gender
 * @property string|null $civility
 * @property string|null $lastname
 * @property string|null $firstname
 * @property string|null $address
 * @property string|null $zip
 * @property string|null $town
 * @property int|null $fk_state
 * @property int|null $fk_country
 * @property Carbon|null $birth
 * @property string|null $birth_place
 * @property string|null $job
 * @property string|null $office_phone
 * @property string|null $office_fax
 * @property string|null $user_mobile
 * @property string|null $personal_mobile
 * @property string|null $email
 * @property string|null $personal_email
 * @property string|null $email_oauth2
 * @property string|null $signature
 * @property string|null $socialnetworks
 * @property int|null $fk_soc
 * @property int|null $fk_socpeople
 * @property int|null $fk_member
 * @property int|null $fk_user
 * @property int|null $fk_user_expense_validator
 * @property int|null $fk_user_holiday_validator
 * @property string|null $idpers1
 * @property string|null $idpers2
 * @property string|null $idpers3
 * @property string|null $note_public
 * @property string|null $note_private
 * @property string|null $model_pdf
 * @property string|null $last_main_doc
 * @property Carbon|null $datelastlogin
 * @property Carbon|null $datepreviouslogin
 * @property Carbon|null $datelastpassvalidation
 * @property Carbon|null $datestartvalidity
 * @property Carbon|null $dateendvalidity
 * @property Carbon|null $flagdelsessionsbefore
 * @property string|null $iplastlogin
 * @property string|null $ippreviouslogin
 * @property string|null $ldap_sid
 * @property string|null $openid
 * @property int|null $statut
 * @property string|null $photo
 * @property string|null $lang
 * @property string|null $color
 * @property string|null $barcode
 * @property int|null $fk_barcode_type
 * @property string|null $accountancy_code
 * @property int|null $nb_holiday
 * @property float|null $thm
 * @property float|null $tjm
 * @property float|null $salary
 * @property float|null $salaryextra
 * @property Carbon|null $dateemployment
 * @property Carbon|null $dateemploymentend
 * @property float|null $weeklyhours
 * @property string|null $import_key
 * @property int|null $default_range
 * @property int|null $default_c_exp_tax_cat
 * @property string|null $national_registration_number
 * @property int|null $fk_warehouse
 *
 * @property Collection|BomBom[] $bom_boms
 * @property Collection|BookcalAvailability[] $bookcal_availabilities
 * @property Collection|BookcalCalendar[] $bookcal_calendars
 * @property Collection|Categorie[] $categories
 * @property Collection|Commande[] $commandes
 * @property Collection|Contrat[] $contrats
 * @property Collection|Delivery[] $deliveries
 * @property Collection|EcmDirectory[] $ecm_directories
 * @property Collection|Expedition[] $expeditions
 * @property Collection|Facture[] $factures
 * @property Collection|FactureFourn[] $facture_fourns
 * @property Collection|FactureFournRec[] $facture_fourn_recs
 * @property Collection|FactureRec[] $facture_recs
 * @property Collection|FichinterRec[] $fichinter_recs
 * @property Collection|HrmEvaluationdet[] $hrm_evaluationdets
 * @property Collection|HrmSkill[] $hrm_skills
 * @property Collection|HrmSkilldet[] $hrm_skilldets
 * @property Collection|HrmSkillrank[] $hrm_skillranks
 * @property Collection|KnowledgemanagementKnowledgerecord[] $knowledgemanagement_knowledgerecords
 * @property Collection|MrpMo[] $mrp_mos
 * @property Collection|PaymentSalary[] $payment_salaries
 * @property Collection|ProductCustomerPrice[] $product_customer_prices
 * @property Collection|ProductFournisseurPrice[] $product_fournisseur_prices
 * @property Collection|ProjetTask[] $projet_tasks
 * @property Collection|Propal[] $propals
 * @property Collection|Reception[] $receptions
 * @property Collection|RecruitmentRecruitmentcandidature[] $recruitment_recruitmentcandidatures
 * @property Collection|RecruitmentRecruitmentjobposition[] $recruitment_recruitmentjobpositions
 * @property Collection|SocieteCommerciaux[] $societe_commerciauxes
 * @property Collection|SocieteRemiseExcept[] $societe_remise_excepts
 * @property Collection|Socperson[] $socpeople
 * @property Collection|StocktransferStocktransfer[] $stocktransfer_stocktransfers
 * @property Collection|UserEmployment[] $user_employments
 * @property Collection|UserRight[] $user_rights
 * @property Collection|UsergroupUser[] $usergroup_users
 * @property Collection|WebhookTarget[] $webhook_targets
 * @property Collection|WorkstationWorkstation[] $workstation_workstations
 */
class User extends Model
{
    public $timestamps = false;
    protected $table = 'user';
    protected $casts = [
        'entity' => 'int',
        'admin' => 'int',
        'employee' => 'int',
        'fk_establishment' => 'int',
        'datec' => 'datetime',
        'tms' => 'datetime',
        'fk_user_creat' => 'int',
        'fk_user_modif' => 'int',
        'fk_state' => 'int',
        'fk_country' => 'int',
        'birth' => 'datetime',
        'fk_soc' => 'int',
        'fk_socpeople' => 'int',
        'fk_member' => 'int',
        'fk_user' => 'int',
        'fk_user_expense_validator' => 'int',
        'fk_user_holiday_validator' => 'int',
        'datelastlogin' => 'datetime',
        'datepreviouslogin' => 'datetime',
        'datelastpassvalidation' => 'datetime',
        'datestartvalidity' => 'datetime',
        'dateendvalidity' => 'datetime',
        'flagdelsessionsbefore' => 'datetime',
        'statut' => 'int',
        'fk_barcode_type' => 'int',
        'nb_holiday' => 'int',
        'thm' => 'float',
        'tjm' => 'float',
        'salary' => 'float',
        'salaryextra' => 'float',
        'dateemployment' => 'datetime',
        'dateemploymentend' => 'datetime',
        'weeklyhours' => 'float',
        'default_range' => 'int',
        'default_c_exp_tax_cat' => 'int',
        'fk_warehouse' => 'int'
    ];

    protected $fillable = [
        'entity',
        'ref_employee',
        'ref_ext',
        'admin',
        'employee',
        'fk_establishment',
        'datec',
        'tms',
        'fk_user_creat',
        'fk_user_modif',
        'login',
        'pass_encoding',
        'pass',
        'pass_crypted',
        'pass_temp',
        'api_key',
        'gender',
        'civility',
        'lastname',
        'firstname',
        'address',
        'zip',
        'town',
        'fk_state',
        'fk_country',
        'birth',
        'birth_place',
        'job',
        'office_phone',
        'office_fax',
        'user_mobile',
        'personal_mobile',
        'email',
        'personal_email',
        'email_oauth2',
        'signature',
        'socialnetworks',
        'fk_soc',
        'fk_socpeople',
        'fk_member',
        'fk_user',
        'fk_user_expense_validator',
        'fk_user_holiday_validator',
        'idpers1',
        'idpers2',
        'idpers3',
        'note_public',
        'note_private',
        'model_pdf',
        'last_main_doc',
        'datelastlogin',
        'datepreviouslogin',
        'datelastpassvalidation',
        'datestartvalidity',
        'dateendvalidity',
        'flagdelsessionsbefore',
        'iplastlogin',
        'ippreviouslogin',
        'ldap_sid',
        'openid',
        'statut',
        'photo',
        'lang',
        'color',
        'barcode',
        'fk_barcode_type',
        'accountancy_code',
        'nb_holiday',
        'thm',
        'tjm',
        'salary',
        'salaryextra',
        'dateemployment',
        'dateemploymentend',
        'weeklyhours',
        'import_key',
        'default_range',
        'default_c_exp_tax_cat',
        'national_registration_number',
        'fk_warehouse'
    ];

    public function bom_boms()
    {
        return $this->hasMany(BomBom::class, 'fk_user_creat');
    }

    public function bookcal_availabilities()
    {
        return $this->hasMany(BookcalAvailability::class, 'fk_user_creat');
    }

    public function bookcal_calendars()
    {
        return $this->hasMany(BookcalCalendar::class, 'fk_user_creat');
    }

    public function categories()
    {
        return $this->belongsToMany(Categorie::class, 'alx_categorie_user', 'fk_user', 'fk_categorie')
            ->withPivot('import_key');
    }

    public function commandes()
    {
        return $this->hasMany(Commande::class, 'fk_user_valid');
    }

    public function contrats()
    {
        return $this->hasMany(Contrat::class, 'fk_user_author');
    }

    public function deliveries()
    {
        return $this->hasMany(Delivery::class, 'fk_user_valid');
    }

    public function ecm_directories()
    {
        return $this->hasMany(EcmDirectory::class, 'fk_user_m');
    }

    public function expeditions()
    {
        return $this->hasMany(Expedition::class, 'fk_user_valid');
    }

    public function factures()
    {
        return $this->hasMany(Facture::class, 'fk_user_valid');
    }

    public function facture_fourns()
    {
        return $this->hasMany(FactureFourn::class, 'fk_user_valid');
    }

    public function facture_fourn_recs()
    {
        return $this->hasMany(FactureFournRec::class, 'fk_user_author');
    }

    public function facture_recs()
    {
        return $this->hasMany(FactureRec::class, 'fk_user_author');
    }

    public function fichinter_recs()
    {
        return $this->hasMany(FichinterRec::class, 'fk_user_author');
    }

    public function hrm_evaluationdets()
    {
        return $this->hasMany(HrmEvaluationdet::class, 'fk_user_creat');
    }

    public function hrm_skills()
    {
        return $this->hasMany(HrmSkill::class, 'fk_user_creat');
    }

    public function hrm_skilldets()
    {
        return $this->hasMany(HrmSkilldet::class, 'fk_user_creat');
    }

    public function hrm_skillranks()
    {
        return $this->hasMany(HrmSkillrank::class, 'fk_user_creat');
    }

    public function knowledgemanagement_knowledgerecords()
    {
        return $this->hasMany(KnowledgemanagementKnowledgerecord::class, 'fk_user_creat');
    }

    public function mrp_mos()
    {
        return $this->hasMany(MrpMo::class, 'fk_user_creat');
    }

    public function payment_salaries()
    {
        return $this->hasMany(PaymentSalary::class, 'fk_user');
    }

    public function product_customer_prices()
    {
        return $this->hasMany(ProductCustomerPrice::class, 'fk_user');
    }

    public function product_fournisseur_prices()
    {
        return $this->hasMany(ProductFournisseurPrice::class, 'fk_user');
    }

    public function projet_tasks()
    {
        return $this->hasMany(ProjetTask::class, 'fk_user_valid');
    }

    public function propals()
    {
        return $this->hasMany(Propal::class, 'fk_user_valid');
    }

    public function receptions()
    {
        return $this->hasMany(Reception::class, 'fk_user_valid');
    }

    public function recruitment_recruitmentcandidatures()
    {
        return $this->hasMany(RecruitmentRecruitmentcandidature::class, 'fk_user_creat');
    }

    public function recruitment_recruitmentjobpositions()
    {
        return $this->hasMany(RecruitmentRecruitmentjobposition::class, 'fk_user_supervisor');
    }

    public function societe_commerciauxes()
    {
        return $this->hasMany(SocieteCommerciaux::class, 'fk_user');
    }

    public function societe_remise_excepts()
    {
        return $this->hasMany(SocieteRemiseExcept::class, 'fk_user');
    }

    public function socpeople()
    {
        return $this->hasMany(Socperson::class, 'fk_user_creat');
    }

    public function stocktransfer_stocktransfers()
    {
        return $this->hasMany(StocktransferStocktransfer::class, 'fk_user_creat');
    }

    public function user_employments()
    {
        return $this->hasMany(UserEmployment::class, 'fk_user');
    }

    public function user_rights()
    {
        return $this->hasMany(UserRight::class, 'fk_user');
    }

    public function usergroup_users()
    {
        return $this->hasMany(UsergroupUser::class, 'fk_user');
    }

    public function webhook_targets()
    {
        return $this->hasMany(WebhookTarget::class, 'fk_user_creat');
    }

    public function workstation_workstations()
    {
        return $this->hasMany(WorkstationWorkstation::class, 'fk_user_creat');
    }
}
