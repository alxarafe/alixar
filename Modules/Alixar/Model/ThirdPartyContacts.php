<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class ThirdPartyContacts
 * Represents table societe_contacts
 */
class ThirdPartyContacts extends Model
{
    protected $table = 'societe_contacts';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'entity',
        'date_creation',
        'fk_soc',
        'fk_c_type_contact',
        'fk_socpeople',
        'import_key',
    ];
}
