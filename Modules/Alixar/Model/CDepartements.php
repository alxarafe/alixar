<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class CDepartements
 * Represents table c_departements
 */
class CDepartements extends Model
{
    protected $table = 'c_departements';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'code_departement',
        'fk_region',
        'cheflieu',
        'tncc',
        'ncc',
        'nom',
        'active',
    ];
}
