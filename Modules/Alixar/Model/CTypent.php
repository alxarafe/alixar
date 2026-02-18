<?php

namespace Modules\Alixar\Model;

use Alxarafe\Base\Model\Model;

/**
 * Class CTypent
 * Represents table c_typent
 */
class CTypent extends Model
{
    protected $table = 'c_typent';
    protected $primaryKey = 'id';
    public $timestamps = false;

    protected $fillable = [
        'id',
        'code',
        'libelle',
        'fk_country',
        'active',
        'module',
        'position',
    ];
}
