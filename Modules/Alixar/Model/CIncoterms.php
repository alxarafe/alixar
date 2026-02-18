<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class CIncoterms
 * Represents table c_incoterms
 */
class CIncoterms extends Model
{
    protected $table = 'c_incoterms';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'code',
        'label',
        'libelle',
        'active',
    ];
}
