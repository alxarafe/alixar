<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class Contact
 * Represents table socpeople
 */
class Contact extends Model
{
    protected $table = 'socpeople';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'datec',
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
        'statut',
        'ip',
    ];
}
