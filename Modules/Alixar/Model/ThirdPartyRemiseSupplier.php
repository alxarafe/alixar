<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class ThirdPartyRemiseSupplier
 * Represents table societe_remise_supplier
 */
class ThirdPartyRemiseSupplier extends Model
{
    protected $table = 'societe_remise_supplier';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'entity',
        'fk_soc',
        'datec',
        'fk_user_author',
        'remise_supplier',
        'note',
    ];
}
