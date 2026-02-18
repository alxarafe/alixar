<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class UserRib
 * Represents table user_rib
 */
class UserRib extends Model
{
    protected $table = 'user_rib';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_user',
        'entity',
        'datec',
        'label',
        'bank',
        'code_banque',
        'code_guichet',
        'number',
        'cle_rib',
        'bic',
        'bic_intermediate',
        'iban_prefix',
        'domiciliation',
        'proprio',
        'owner_address',
        'state_id',
        'fk_country',
        'currency_code',
        'default_rib',
    ];
}
