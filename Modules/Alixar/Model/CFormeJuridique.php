<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class CFormeJuridique
 * Represents table c_forme_juridique
 */
class CFormeJuridique extends Model
{
    protected $table = 'c_forme_juridique';
    protected $primaryKey = 'rowid';
    public $timestamps = false;

    protected $fillable = [
        'code',
        'fk_pays',
        'libelle',
        'isvatexempted',
        'active',
        'module',
        'position',
    ];
}
