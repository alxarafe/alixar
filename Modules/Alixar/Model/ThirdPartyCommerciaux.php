<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class ThirdPartyCommerciaux
 * Represents table societe_commerciaux
 */
class ThirdPartyCommerciaux extends Model
{
    protected $table = 'societe_commerciaux';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'fk_soc',
        'fk_user',
        'fk_c_type_contact_code',
        'import_key',
    ];
}
