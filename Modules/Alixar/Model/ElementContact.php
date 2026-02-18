<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class ElementContact
 * Represents table element_contact
 */
class ElementContact extends Model
{
    protected $table = 'element_contact';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'datecreate',
        'statut',
        'element_id',
        'fk_c_type_contact',
        'fk_socpeople',
    ];
}
