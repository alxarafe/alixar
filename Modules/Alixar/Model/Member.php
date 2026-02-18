<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class Member
 * Represents table adherent
 */
class Member extends Model
{
    protected $table = 'adherent';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'ref',
        'entity',
        'ref_ext',
        'gender',
        'civility',
        'lastname',
        'firstname',
        'login',
        'pass',
        'pass_crypted',
        'fk_adherent_type',
        'morphy',
        'societe',
        'fk_soc',
        'address',
        'zip',
        'town',
        'state_id',
        'country',
        'email',
        'url',
        'socialnetworks',
        'phone',
        'phone_perso',
        'phone_mobile',
        'birth',
        'photo',
        'statut',
        'public',
        'datefin',
        'default_lang',
        'note_private',
        'note_public',
        'model_pdf',
        'datevalid',
        'datec',
        'fk_user_author',
        'fk_user_mod',
        'fk_user_valid',
        'canvas',
        'ip',
        'import_key',
    ];
}
