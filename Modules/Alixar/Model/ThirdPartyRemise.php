<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class ThirdPartyRemise
 * Represents table societe_remise
 */
class ThirdPartyRemise extends Model
{
    protected $table = 'societe_remise';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'entity',
        'fk_soc',
        'datec',
        'fk_user_author',
        'remise_client',
        'note',
    ];
}
