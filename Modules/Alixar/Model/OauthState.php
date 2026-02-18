<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class OauthState
 * Represents table oauth_state
 */
class OauthState extends Model
{
    protected $table = 'oauth_state';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'service',
        'state',
        'fk_user',
        'fk_adherent',
        'entity',
    ];
}
