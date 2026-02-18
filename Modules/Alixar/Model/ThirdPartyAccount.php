<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class ThirdPartyAccount
 * Represents table societe_account
 */
class ThirdPartyAccount extends Model
{
    protected $table = 'societe_account';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'entity',
        'login',
        'pass_encoding',
        'pass_crypted',
        'pass_temp',
        'fk_soc',
        'fk_website',
        'site',
        'site_account',
        'key_account',
        'note_private',
        'date_last_login',
        'date_previous_login',
        'date_last_reset_password',
        'date_creation',
        'fk_user_creat',
        'fk_user_modif',
        'import_key',
        'status',
    ];
}
