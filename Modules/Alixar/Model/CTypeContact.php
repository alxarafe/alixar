<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class CTypeContact
 * Represents table c_type_contact
 */
class CTypeContact extends Model
{
    protected $table = 'c_type_contact';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'element',
        'source',
        'code',
        'libelle',
        'active',
        'module',
        'position',
    ];
}
