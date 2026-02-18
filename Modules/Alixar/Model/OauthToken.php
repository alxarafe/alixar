<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class OauthToken
 * Represents table oauth_token
 */
class OauthToken extends Model
{
    protected $table = 'oauth_token';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'service',
        'token',
        'tokenstring',
        'state',
        'fk_soc',
        'fk_user',
        'fk_adherent',
        'restricted_ips',
        'datec',
        'entity',
    ];
}
