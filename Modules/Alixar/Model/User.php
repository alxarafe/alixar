<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class User
 * Represents table user
 */
class User extends Model
{
    protected $table = 'user';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'entity',
        'ref_employee',
        'ref_ext',
        'admin',
        'employee',
        'fk_establishment',
        'datec',
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
        'national_registration_number',
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
        'accountancy_code_user_general',
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
        'fk_warehouse',
    ];
}
